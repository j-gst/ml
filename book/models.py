"""
models book app
Objektorientierte Scriptsprachen WS 2014
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from django.contrib.auth.models import User
from django.db.models import Avg

""" BookOwning
Speicherung ob ein Benutzer ein Buch gelesen hat oder besitzt
"""
@python_2_unicode_compatible
class BookOwning(models.Model):
    OWN = (
        ('Ja', 'Ja'),
        ('Nein', 'Nein'),
    )
    READ = (
        ('Ja', 'Ja'),
        ('Nein', 'Nein'),
    )
    own = models.CharField(max_length=15, choices = OWN, default = 'Nein' )
    read = models.CharField(max_length=15, choices = READ, default = 'Nein' )
    user = models.ForeignKey(User, unique=False)
    book = models.ForeignKey('Book', unique=False)
    owningdate = models.DateTimeField(auto_now=True)
    def __str__(self):
        return 'Gehoert mir: %s, Habe ich gelesen: %s ' % (self.own, self.read)
    class Meta:
        unique_together = (('user', 'book'),)

""" BookRating
Speicherung der Bewertung eines Buches
"""
@python_2_unicode_compatible
class BookRating(models.Model):
    CHOICE = (
    (1, '1'),
    (2, '2'),
    (3, '3'),
    (4, '4'),
    (5, '5'),
)
    rating = models.IntegerField(max_length=1,default=1, choices=CHOICE)
    user = models.ForeignKey(User, unique=False)
    book = models.ForeignKey('Book', unique=False)
    ratingdate = models.DateTimeField(auto_now=True)
    def __str__(self):
        return '%s' % (self.rating)
    class Meta:
        unique_together = (('user', 'book'),)

""" BookComment
Kommentare zu Buechern
"""      
@python_2_unicode_compatible
class BookComment(models.Model):

    text = models.TextField('Kommentartext',  blank=False)
    user = models.ForeignKey(User, unique=False)
    book = models.ForeignKey('Book', unique=False)
    commentdate = models.DateTimeField(auto_now=True)
    def __str__(self):
        return '%s' % (self.text)

""" Author
"""
@python_2_unicode_compatible
class Author(models.Model):
    firstname = models.CharField('lastname', max_length=255, )
    lastname = models.CharField('firstname', max_length=255, )

    def __str__(self):
        return '%s, %s' % (self.lastname, self.firstname)

""" Category
"""
@python_2_unicode_compatible
class Category(models.Model):
    categoryname = models.CharField('category', max_length=255)

    def __str__(self):
        return '%s' % (self.categoryname)

""" Book
"""
@python_2_unicode_compatible
class Book(models.Model):
    title = models.CharField( max_length=255, )
    isbn = models.CharField( max_length=100, )
    description = models.TextField(u'Beschreibung', blank=True)
    authors = models.ManyToManyField(Author, verbose_name=u'Autoren')
    pages = models.IntegerField( max_length=4,verbose_name=u'Seitenzahl' )
    categories = models.ManyToManyField(Category, verbose_name=u'Kategorien')
    cover = models.FileField(upload_to='cover/book/%Y%m%d', default='cover/default/default.png')
    booktimestamp = models.DateTimeField(auto_now=True)
    
    # Durchschnittliche Bewertung ermitteln
    def orderRating(self):
        return BookRating.objects.all().filter(book_id=self.id).aggregate(Avg('rating'))['rating__avg']
    def __str__(self):
        return self.title
    def printAuthors(self):
        return self.authors.all()
        
    # String zur Ausgabe der Bewertungen
    def printAvgRating(self):
        bookRatings = BookRating.objects.all().filter(book_id=self.id) 
        count = bookRatings.count()
        if count != 0:
            avg = ("%.1f" % round(bookRatings.aggregate(Avg('rating'))['rating__avg'],1))
            avg = avg + ' ('+str(count)+' Bewertungen)'
        else:
            avg = 'noch keine Bewertungen'
        
        return avg
        
        
        
        
        
        
