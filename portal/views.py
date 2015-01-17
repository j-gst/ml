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

    if pk == None:
        page_title = 'Neuen Autor speichern'
    else:
        author = get_object_or_404(Author, pk = pk)
        page_title = 'Autor bearbeiten'

    if request.method == 'POST':
        form = AuthorForm(request.POST, instance = author)
        if request.POST.get('submit'):
            if form.is_valid():
                form.save()
                messages.success(request, 'Autor wurde gespeichert.')
                return HttpResponseRedirect(('/portal/authorlist/'))
            else:
                context = {'author_form': form}
                return render(request, 'portal/addAuthor.html', context)
        elif request.POST.get('delete'):
            author.delete()
            return HttpResponseRedirect(('/portal/authorlist/'))
        else:
            messages.success(request, 'Etwas lief schief.')
            return HttpResponseRedirect(('/portal/authorlist/'))
    else:
        form = AuthorForm(request.POST, instance = author)
        context = {'page_title':page_title,'author_form': form}
        return render(request, 'portal/addAuthor.html', context)


def detailBook(request, pk = None):
    form = BookCommentForm()
    form2 = BookRatingForm()
    form3 = BookOwningForm()
    book = get_object_or_404(Book, pk = pk)
    comments = BookComment.objects.all().filter(book_id=pk).order_by('-commentdate')
    count = BookRating.objects.all().filter(book_id=pk).count()
    if count != 0:
        avg = ("%.1f" % round(BookRating.objects.all().filter(book_id=pk).aggregate(Avg('rating'))['rating__avg'],1))
    else:
        avg = 0
    ownRating = BookRating.objects.all().filter(user_id=request.user.id, book_id = pk)
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
        
    context = {'book': book,'form': form,'form2': form2, 'form3': form3,'comments':comments,'count':count,'avg':avg, 'ownRating': ownRating, 'owning': owning}
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

    form = BookForm()
    form2 = AuthorForm()
    author = Author()
    book = Book()
    if pk == None:
        page_title = 'Neues Buch speichern'
    else:
        book = get_object_or_404(Book, pk = pk)
        page_title = 'Buch bearbeiten'
    if request.method == 'POST':
        form = BookForm(request.POST, instance = book)
        form2 = AuthorForm(request.POST, instance = author)


        form = BookForm(request.POST, instance = book)
        form2 = AuthorForm(request.POST, instance = author)
        if request.POST.get('submit'):
            if form2.is_valid() :
                form2.save()
                messages.success(request, 'Autor wurde gespeichert.')
                return HttpResponseRedirect(('/portal/book/add/'))
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
            return HttpResponseRedirect(('/portal/books/1/'))
        else:
            messages.success(request, 'Etwas lief schief.')
            return HttpResponseRedirect(('/portal/books/1/'))

    else:
        form = BookForm(instance = book)
        context = {'page_title':page_title,'book_form': form, 'author_form': form2,}
        return render(request, 'portal/book.html', context)


        
def books(request, page = '1', search=''):

    allBooks = Book.objects.all().order_by('title').filter(title__contains=search)

    page = int(page)
    elements_per_page = 5
    start = (page-1) * elements_per_page
    end = start + elements_per_page

    books = allBooks[start:end]
    number = allBooks.count()
    
    pageNum = int(round(number / float(elements_per_page),0))
    if pageNum == 0:
        pageNum = 1
    
    return render(request, 'portal/booklist.html', {'books':books, 'number':number, 'pageNum': pageNum, 'pageRange':range(1,pageNum+1),'page':page })

























