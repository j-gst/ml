"""
models film app
Objektorientierte Scriptsprachen WS 2014
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from django.contrib.auth.models import User
from django.db.models import Avg

""" Category
"""
@python_2_unicode_compatible
class Category(models.Model):
    categoryname = models.CharField('category', max_length=255)
    def __str__(self):
        return '%s' % (self.categoryname)

""" FilmComment
Kommentare zu Filmen
"""     
@python_2_unicode_compatible 
class FilmComment(models.Model):

    text = models.TextField('Kommentartext',  blank=False)
    user = models.ForeignKey(User, unique=False)
    film = models.ForeignKey('Film', unique=False)
    commentdate = models.DateTimeField(auto_now=True)
    def __str__(self):
        return '%s' % (self.text)
        
""" FilmOwning
Speicherung ob ein Benutzer ein Film gesehen hat oder besitzt
"""   
@python_2_unicode_compatible
class FilmOwning(models.Model):
    OWN = (
        ('Ja', 'Ja'),
        ('Nein', 'Nein'),
    )
    SEEN = (
        ('Ja', 'Ja'),
        ('Nein', 'Nein'),
    )
    own = models.CharField(max_length=15, choices = OWN, default = 'Nein' )
    seen = models.CharField(max_length=15, choices = SEEN, default = 'Nein' )
    user = models.ForeignKey(User, unique=False)
    film = models.ForeignKey('Film', unique=False)
    owningdate = models.DateTimeField(auto_now=True)
    def __str__(self):
        return 'Gehoert mir: %s, Habe ich gesehen: %s ' % (self.own, self.seen)
    class Meta:
        unique_together = (('user', 'film'),)     
        
""" Participant
"""
@python_2_unicode_compatible
class Participant(models.Model):
    CHOICE = (
    ('director', 'Regisseur'),
    ('writer', 'Autor'),
    ('star', 'Schauspieler'),
)
    firstname = models.CharField('lastname', max_length=255, )
    lastname = models.CharField('firstname', max_length=255, )
    role = models.CharField(max_length=40, choices=CHOICE)

    def __str__(self):
        return '%s, %s (%s)' % (self.lastname, self.firstname, self.role)

""" FilmRating
Speicherung der Bewertung eines Filmes
"""
@python_2_unicode_compatible
class FilmRating(models.Model):
    CHOICE = (
    (1, '1'),
    (2, '2'),
    (3, '3'),
    (4, '4'),
    (5, '5'),
)
    rating = models.IntegerField(max_length=1,default=1, choices=CHOICE)
    user = models.ForeignKey(User, unique=False)
    film = models.ForeignKey('Film', unique=False)
    ratingdate = models.DateTimeField(auto_now=True)
    def __str__(self):
        return '%s' % (self.rating)
    class Meta:
        unique_together = (('user', 'film'),)     
        
""" Film
"""
@python_2_unicode_compatible
class Film(models.Model):
    title = models.CharField( max_length=255, verbose_name=u'Titel')
    year = models.CharField( max_length=4,verbose_name=u'Jahr' )
    length = models.CharField( max_length=3,verbose_name=u'Spieldauer in Minuten' )
 
    description = models.TextField(u'Beschreibung', blank=True)
    participants  = models.ManyToManyField(Participant , verbose_name=u'Mitwirkende')
    categories = models.ManyToManyField(Category, verbose_name=u'Kategorien')
    cover = models.FileField(upload_to='cover/film/%Y%m%d', default='cover/default/default.png')
    
    filmtimestamp = models.DateTimeField(auto_now=True)
   
    def printCategories(self):
        categoryStr = ''
        for cat in self.categories.all():
            categoryStr = categoryStr + " " + str(cat)
        return categoryStr
           
    def orderRating(self):
        return FilmRating.objects.all().filter(film_id=self.id).aggregate(Avg('rating'))['rating__avg']
        

    def __str__(self):
        return self.title
    def printParticipant(self):
        return self.participants.all()
    def printAvgRating(self):
        filmRatings = FilmRating.objects.all().filter(film_id=self.id) 
        count = filmRatings.count()
        if count != 0:
            avg = ("%.1f" % round(filmRatings.aggregate(Avg('rating'))['rating__avg'],1))
            avg = avg + ' ('+str(count)+' Bewertungen)'
        else:
            avg = 'noch keine Bewertungen'
        
        return avg  
