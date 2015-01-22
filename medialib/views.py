from django.shortcuts import render
from book.models import Book
from film.models import Film


def index(request):
    books = Book.objects.all().order_by('-booktimestamp')[:3]
    films = Film.objects.all().order_by('-filmtimestamp')[:3]
    return render(request, 'index.html', {'curPage':'home', 'books': books, 'films': films,})
