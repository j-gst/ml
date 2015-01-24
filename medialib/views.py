"""
view medialib Projekt
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.shortcuts import render
from book.models import Book
from film.models import Film
from django.contrib.auth.models import User

""" index Seite
"""
def index(request):
    allBooks = Book.objects.all()
    allFilms = Film.objects.all()
    books = allBooks.order_by('-booktimestamp')[:4]
    films = allFilms.order_by('-filmtimestamp')[:4]
    userC = User.objects.all().count()
    filmC = allFilms.count()
    bookC = allBooks.count()
    return render(request, 'index.html', {'curPage':'home', 'books': books, 'films': films,'userC':userC, 'filmC':filmC,'bookC':bookC })
