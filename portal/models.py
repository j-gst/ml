from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from django.contrib.auth.models import User

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


@python_2_unicode_compatible
class BookComment(models.Model):

    text = models.TextField('Kommentartext',  blank=False)
    user = models.ForeignKey(User, unique=False)
    book = models.ForeignKey('Book', unique=False)
    commentdate = models.DateTimeField(auto_now=True)
    def __str__(self):
        return '%s' % (self.text)





@python_2_unicode_compatible
class Author(models.Model):
    firstname = models.CharField('lastname', max_length=255, )
    lastname = models.CharField('firstname', max_length=255, )

    def __str__(self):
        return '%s, %s' % (self.lastname, self.firstname)




 #Create your models here.
@python_2_unicode_compatible
class Book(models.Model):
    title = models.CharField( max_length=255, )
    isbn = models.CharField( max_length=100, )
    description = models.TextField(u'Beschreibung', blank=True)
    authors = models.ManyToManyField(Author, verbose_name=u'Autoren')
    cover = models.FileField(upload_to='cover/%Y%m%d', default='cover/default/default.png')

    
    def __str__(self):
        return self.title
    def printAuthors(self):
        return self.authors.all()

