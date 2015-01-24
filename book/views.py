"""
views book app
Objektorientierte Scriptsprachen WS 2014
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.contrib import messages
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from book.models import *
from book.forms import *
from django.contrib.auth.decorators import permission_required
from django.db.models import Avg
from django.conf import settings

""" index
Umleitung auf Buchliste
"""
def index(request):
    return HttpResponseRedirect(('/book/books/'))
   
""" authors
Liste der Autoren
"""
def authors(request, page = '1', search=''):
    elements_per_page = settings.PAGINATION_ELEM_PER_PAGE
    allAuthors = Author.objects.all().order_by('lastname').filter(lastname__contains=search).filter(firstname__contains=search)

    page = int(page)
    
    start = (page-1) * elements_per_page
    end = start + elements_per_page

    authors = allAuthors[start:end]
    number = allAuthors.count()

    pageNum = int(round(number / float(elements_per_page),0))
    
    # abgerundet?
    if pageNum < round(number / float(elements_per_page),1):
        pageNum = pageNum+1
    
    if pageNum == 0:
        pageNum = 1

    return render(request, 'book/authorlist.html', {'authors':authors, 'number':number, 'pageNum': pageNum, 'pageRange':range(1,pageNum+1),'page':page })

""" addAuthor
Autor hinzufuegen
"""
def addAuthor(request, pk = None):
    form = AuthorForm()
    author = Author()
    
    new = False
    if pk == None:
        page_title = 'Neuen Autor speichern'
        new = True
    else:
        author = get_object_or_404(Author, pk = pk)
        page_title = 'Autor bearbeiten'

    if request.method == 'POST':
        form = AuthorForm(request.POST, instance = author)
        if request.POST.get('submit'):
            if form.is_valid():
                form.save()
                messages.success(request, 'Autor wurde gespeichert.')
                return HttpResponseRedirect(('/book/authors/'))

        elif request.POST.get('delete'):
            author.delete()
            return HttpResponseRedirect(('/book/authors/'))
        else:
            messages.error(request, 'Etwas lief schief.')
            return HttpResponseRedirect(('/book/authors/'))
    else:
        form = AuthorForm(instance = author)
    context = {'page_title':page_title,'author_form': form,'new':new, }
    return render(request, 'book/addAuthor.html', context)

""" detailBook
Detailansicht zu einem Buch
"""
def detailBook(request, pk = None):
    form = BookCommentForm()
    form2 = BookRatingForm()
    form3 = BookOwningForm()
    book = get_object_or_404(Book, pk = pk)
    bookRatings = BookRating.objects.all()
    comments = BookComment.objects.all().filter(book_id=pk).order_by('-commentdate')
    count = bookRatings.filter(book_id=pk).count()
    ownRating = bookRatings.filter(user_id=request.user.id, book_id = pk)
    
    try:
        ownRating = ownRating[0]
    except:
        ownRating = 0

    owning = BookOwning.objects.all().filter(user_id=request.user.id, book_id = pk)

    try:
        owning = owning[0]
    except:
        owning = 0
        
    context = {'book': book,'form': form,'form2': form2, 'form3': form3,'comments':comments,'count':count, 'ownRating': ownRating, 'owning': owning}
    return render(request, 'book/book_detail.html', context)

""" commentBook
Buch kommentieren
""" 
def commentBook(request, pk = None):
    comment = BookComment(user_id=request.user.id, book_id=pk)
    if request.method == 'POST':
        form = BookCommentForm(request.POST, instance = comment)
     
        if form.is_valid() :
            form.save()
        else:
            messages.error(request, 'Kommentar konnte nicht gespeichert werden.')
    return HttpResponseRedirect(('/book/book/detail/'+pk+'/'))

""" deleteComment
Kommentar loeschen
"""
def deleteComment(request, pk = None, bpk = None):
    comment = BookComment
    if pk == None:
        page_title = 'Etwas ist schief '
    else:
        comment = get_object_or_404(BookComment, pk = pk)
        comment.delete()
        messages.success(request, 'Kommentar wurde geloescht.')
        if bpk == None:
            return HttpResponseRedirect(('/book/books/1/'))
        else:
            return HttpResponseRedirect(('/book/book/detail/'+bpk+'/'))

""" ownBook
Festlegen ob Buch gelesen und besessen wird
"""
def ownBook(request, pk = None):
    owning = BookOwning(user_id=request.user.id, book_id=pk)
    if request.method == 'POST':
        form = BookOwningForm(request.POST, instance = owning)
        if form.is_valid():
            form.save()
        else:
            messages.error(request, 'Beim speichern ist ein Fehler aufgetreten.')
    return HttpResponseRedirect(('/book/book/detail/'+pk+'/'))
     
""" rateBook
Buch bewerten
""" 
def rateBook(request, pk = None):
    rating = BookRating(user_id=request.user.id, book_id=pk)
    if request.method == 'POST':
        form = BookRatingForm(request.POST, instance = rating)
       
        if form.is_valid() :
            try:
                form.save()
            except:
                pass
        else:
            messages.error(request, 'Bewertung konnte nicht gespeichert werden.')
    return HttpResponseRedirect(('/book/book/detail/'+pk+'/'))
   
""" editBook
Buch editieren
""" 
@permission_required('book.add_book', login_url='/user/login/')
def editBook(request, pk = None):
    
    category = Category()
    book = Book()
    author = Author()
    form = BookForm()
    # Zusaetzliche Forms fuer Anlegen Autor/Kategorie per Ajax
    form2 = AuthorForm()
    form3 = CategoryForm()
     
    # neues Buch ?
    new = False
    if pk == None:
        page_title = 'Neues Buch speichern'
        new = True       
    else:
        book = get_object_or_404(Book, pk = pk)
        page_title = 'Buch bearbeiten'
        
    if request.method == 'POST':
        form = BookForm(request.POST, instance = book)
        if request.POST.get('submit'):
            if form.is_valid():
                newbook = form.save(commit = False)
                # ist ein Cover hochgeladen worden?
                try:
                    newbook.cover = request.FILES['cover']
                except:
                    pass
                newbook.save()
                form.save_m2m()
                messages.success(request, 'Buch wurde gespeichert.')
                return HttpResponseRedirect(('/book/books/1/'))
            else:
                messages.error(request, (u'Die Eingabe ist nicht vollstaendig korrekt.'))
        elif request.POST.get('delete'):
            book.delete()
            messages.success(request, 'Buch wurde entfernt.')
            return HttpResponseRedirect(('/book/books/1/'))
        else:
            messages.error(request, 'Etwas lief schief.')
            return HttpResponseRedirect(('/book/books/1/'))
    else:
        form = BookForm(instance = book)
        context = {'page_title':page_title,'book_form': form, 'author_form': form2, 'category_form': form3,'new':new,}
        return render(request, 'book/book.html', context)
 
""" addBookCategory
Anlegen einer Kategorie per Ajax
"""
def addBookCategory(request):
    category = Category()
    form = CategoryForm(request.POST, instance = category)
    if request.POST:
        if form.is_valid():
            form.save()   
    return HttpResponse()          

""" addBookAuthor
Anlegen eines Autors per Ajax
"""
def addBookAuthor(request):
    author = Author()
    form = AuthorForm(request.POST, instance = author)
    if request.POST:
        if form.is_valid():
            form.save()
    return HttpResponse()     
        
""" books
Anzeige der Buecherliste
"""      
def books(request, page = '1'):

    elements_per_page = settings.PAGINATION_ELEM_PER_PAGE
    
    # sind Filter/Suchbegriff gesetzt?
    search = '' 
    if "search" in request.session and request.session["search"] != None:
        search = request.session["search"]
    filter = '' 
    if "filter" in request.session and request.session["filter"] != None:
        filter = request.session["filter"]
     
    # alle Buecher - Suchbegriff beruecksichtigen
    allBooks = Book.objects.all().filter(title__contains=search)
    
    # Sortierung - Default: Titel
    if "orderBooksBy" in request.session:
        orderBy = request.session["orderBooksBy"]
    else:
        orderBy = 'title'    
    
    # Sortierung Reihenfolge
    reverseOrder = True
    if "reverse" in request.session:
        reverseOrder = request.session["reverse"]
    
    # Seite? 
    if page != None:
        page = int(page)
    else:
        page = 0

    # Sortieren
    orderImg = 'down'
    o = 'title'
    if reverseOrder:
        orderImg = 'up'
    else:
        o = '-title'
        
    # Buecher als Liste
    orderBooks = list(allBooks.order_by(o))
    # rating muss extra sortiert werden (kein Model Feld)
    if orderBy == 'rating':
        orderBooks.sort( key=rating,reverse = not reverseOrder )
    
    # filtern
    if filter != '':
        for b in orderBooks[:]:
            own = BookOwning.objects.all().filter(book_id = b.id).filter(user_id=request.user.id)
            if  own.count() > 0 and own[0].own == 'Ja':
                if filter == 'nicht gelesen':
                    orderBooks.remove(b)
            else:
                if filter == 'gelesen':
                    orderBooks.remove(b)

    number = len(orderBooks)
    pageNum = int(round(number / float(elements_per_page),0))
    
    # abgerundet?
    if pageNum < round(number / float(elements_per_page),1):
        pageNum = pageNum+1
    # mindestens eine Seite zeigen
    if pageNum == 0:
        pageNum = 1

    start = (page-1) * elements_per_page
    end = start + elements_per_page
    
    # pagination
    books = orderBooks[start:end]
    
    context = {'TitelSearch':search,'orderBy':orderBy,'books':books, 'number':number, 'pageNum': pageNum,'orderImg':orderImg, 'pageRange':range(1,pageNum+1),'page':page,'filter':filter,'curPage':'books', }
 
    return render(request, 'book/booklist.html', context)
    
""" rating
Durchschnittliche Bewertung ermitteln
"""
def rating( book ):
    return book.orderRating()

"""
Sortierungskriterium in Session setzen
"""
def setOrderBooks(request, order):  
    if "orderBooksBy" in request.session:
        if order == request.session["orderBooksBy"]:  
            # Reihenfolge umdrehen?
            if "reverse" in request.session:
                request.session["reverse"] = not request.session["reverse"]
            else:
                request.session["reverse"] = True
    request.session["orderBooksBy"] = order
    return HttpResponseRedirect(('/book/books/1/'))

""" setBookSearch
Suchbegriff in Session setzen
"""   
def setBookSearch(request):
    request.session["search"] = request.POST.get('search', '')
    return HttpResponseRedirect(('/book/books/1/'))
    
""" setBookFilter
Filter in Session setzen
"""
def setBookFilter(request):
    request.session["filter"] = request.POST.get('filter', '')
    return HttpResponseRedirect(('/book/books/1/'))
