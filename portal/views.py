from django.contrib import messages
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from portal.models import *
from portal.forms import *
from django.contrib.auth.decorators import permission_required
from django.db.models import Avg







# Create your views here.
def index(request):
    return render(request, 'portal/index.html', None)
   

def authors(request, page = '1', search=''):

    allAuthors = Author.objects.all().order_by('lastname').filter(lastname__contains=search).filter(firstname__contains=search)

    page = int(page)
    elements_per_page = 5
    start = (page-1) * elements_per_page
    end = start + elements_per_page

    authors = allAuthors[start:end]
    number = allAuthors.count()

    pageNum = int(round(number / float(elements_per_page),0))
    if pageNum == 0:
        pageNum = 1

    return render(request, 'portal/authorlist.html', {'authors':authors, 'number':number, 'pageNum': pageNum, 'pageRange':range(1,pageNum+1),'page':page })


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
                return HttpResponseRedirect(('/portal/authors/'))
            #else:
                #context = {'author_form': form}
                #return render(request, 'portal/addAuthor.html', context)
        elif request.POST.get('delete'):
            author.delete()
            return HttpResponseRedirect(('/portal/authors/'))
        else:
            messages.error(request, 'Etwas lief schief.')
            return HttpResponseRedirect(('/portal/authors/'))
    else:
        form = AuthorForm(instance = author)
    context = {'page_title':page_title,'author_form': form,'new':new, }
    return render(request, 'portal/addAuthor.html', context)


def detailBook(request, pk = None):
    form = BookCommentForm()
    form2 = BookRatingForm()
    form3 = BookOwningForm()
    book = get_object_or_404(Book, pk = pk)
    bookRatings = BookRating.objects.all()
    comments = BookComment.objects.all().filter(book_id=pk).order_by('-commentdate')
    count = bookRatings.filter(book_id=pk).count()
    ownRating = bookRatings.filter(user_id=request.user.id, book_id = pk)
    #rated = False if ownRating == 0 else  True
    
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
    return render(request, 'portal/book_detail.html', context)

    
def commentBook(request, pk = None):
    
    comment = BookComment(user_id=request.user.id, book_id=pk)
    if request.method == 'POST':
        form = BookCommentForm(request.POST, instance = comment)
     
        if form.is_valid() :
            form.save()
        else:
            messages.error(request, 'Kommentar konnte nicht gespeichert werden.')
    return HttpResponseRedirect(('/portal/book/detail/'+pk+'/'))

def ownBook(request, pk = None):
    owning = BookOwning(user_id=request.user.id, book_id=pk)
    if request.method == 'POST':
        form = BookOwningForm(request.POST, instance = owning)

        if form.is_valid():
            form.save()
        else:
            messages.error(request, 'Beim speichern ist ein Fehler aufgetreten.')
    return HttpResponseRedirect(('/portal/book/detail/'+pk+'/'))
    
    
    
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
    return HttpResponseRedirect(('/portal/book/detail/'+pk+'/'))
  
    
    
    
    
@permission_required('portal.add_book', login_url='/user/login/')
#Beate 02.01.2015
def editBook(request, pk = None):
    
    category = Category()
    book = Book()
    author = Author()
    form = BookForm()
    form2 = AuthorForm()
    form3 = CategoryForm()
    
    
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
                try:
                    newbook.cover = request.FILES['cover']
                except:
                    pass
                newbook.save()
                form.save_m2m()
                messages.success(request, 'Buch wurde gespeichert.')
                return HttpResponseRedirect(('/portal/books/1/'))
            else:
                messages.error(request, (u'Die Eingabe ist nicht vollstaendig korrekt.'))
        elif request.POST.get('delete'):
            book.delete()
            messages.success(request, 'Buch wurde entfernt.')
            return HttpResponseRedirect(('/portal/books/1/'))
        else:
            messages.error(request, 'Etwas lief schief.')
            return HttpResponseRedirect(('/portal/books/1/'))

    else:
        form = BookForm(instance = book)
        context = {'page_title':page_title,'book_form': form, 'author_form': form2, 'category_form': form3,'new':new,}
        return render(request, 'portal/book.html', context)


def addBookCategory(request):
    category = Category()
    form = CategoryForm(request.POST, instance = category)
    if request.POST:
        if form.is_valid():
            form.save()   
    return HttpResponseRedirect(('/portal/book/add/'))        

def addBookAuthor(request):
    author = Author()
    form = AuthorForm(request.POST, instance = author)
    if request.POST:
        if form.is_valid():
            form.save()
    return HttpResponseRedirect(('/portal/book/add/'))   
        
        
def books(request, page = '1',  filter = None):

    elements_per_page = 5
    
    search = '' 
    if "search" in request.session and request.session["search"] != None:
        search = request.session["search"]
    
    filter = '' 
    if "filter" in request.session and request.session["filter"] != None:
        filter = request.session["filter"]
          
    allBooks = Book.objects.all().filter(title__contains=search)
    
    
    if "orderBooksBy" in request.session:
        orderBy = request.session["orderBooksBy"]
    else:
        orderBy = 'title'    
    
    reverseOrder = True
    if "reverse" in request.session:
        reverseOrder = request.session["reverse"]
 
   
    
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
    orderBooks = list(allBooks.order_by(o))
    if orderBy == 'rating':
        orderBooks.sort( key=rating,reverse = not reverseOrder )
    
    debStr = 'Remove: '
    #filter = ''
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
    if pageNum == 0:
        pageNum = 1
    

    
    start = (page-1) * elements_per_page
    end = start + elements_per_page
    books = orderBooks[start:end]
 
    return render(request, 'portal/booklist.html', {'TitelSearch':search,'orderBy':orderBy,'books':books, 'number':number, 'pageNum': pageNum,'orderImg':orderImg, 'pageRange':range(1,pageNum+1),'page':page,'filter':filter })

    

def rating( book ):
    return book.orderRating()


def setOrderBooks(request, order):  
    if "orderBooksBy" in request.session:
        if order == request.session["orderBooksBy"]:  
            if "reverse" in request.session:
                request.session["reverse"] = not request.session["reverse"]
            else:
                request.session["reverse"] = True
    request.session["orderBooksBy"] = order
    return HttpResponseRedirect(('/portal/books/1/'))

    
    
    
    
def setBookSearch(request):

    request.session["search"] = request.POST.get('search', '')
    return HttpResponseRedirect(('/portal/books/1/'))

def setBookFilter(request):

    request.session["filter"] = request.POST.get('filter', '')
    return HttpResponseRedirect(('/portal/books/1/'))



















