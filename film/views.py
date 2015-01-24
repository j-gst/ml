"""
views film app
Objektorientierte Scriptsprachen WS 2014
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.contrib import messages
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from film.models import *
from film.forms import *
from django.contrib.auth.decorators import permission_required
from django.db.models import Avg
from django.conf import settings

""" index
Umleitung auf Filmliste
"""
def index(request):
    return HttpResponseRedirect(('/film/films/'))
    
""" addParticipant
Mitwirkenden hinzufuegen
"""
def addParticipant(request, pk = None):
    form = ParticipantForm()
    participant = Participant()
    
    new = False
    if pk == None:
        page_title = 'Neuen Mitwirkenden speichern'
        new = True
    else:
        participant = get_object_or_404(Participant, pk = pk)
        page_title = 'Mitwirkenden bearbeiten'
        
    if request.method == 'POST':
        form = ParticipantForm(request.POST, instance = participant)
        if request.POST.get('submit'):
            if form.is_valid():
                form.save()
                messages.success(request, 'Mitwirkenden wurde gespeichert.')
                return HttpResponseRedirect(('/film/participants/'))
        elif request.POST.get('delete'):
            participant.delete()
            return HttpResponseRedirect(('/film/participants/'))
        else:
            messages.error(request, 'Etwas lief schief.')
            return HttpResponseRedirect(('/film/participants/'))
    else:
        form = ParticipantForm(instance = participant)
    context = {'page_title':page_title,'participant_form': form,'new':new, }
    return render(request, 'film/addParticipant.html', context)
    
""" participants
Liste der Mitwirkenden
"""  
def participants(request, page = '1', search=''):
    elements_per_page = settings.PAGINATION_ELEM_PER_PAGE
    allParticipants = Participant.objects.all().order_by('lastname').filter(lastname__contains=search).filter(firstname__contains=search)

    page = int(page)

    start = (page-1) * elements_per_page
    end = start + elements_per_page

    participants = allParticipants[start:end]
    number = allParticipants.count()

    pageNum = int(round(number / float(elements_per_page),0))
    
    # abgerundet?
    if pageNum < round(number / float(elements_per_page),1):
        pageNum = pageNum+1
    
    if pageNum == 0:
        pageNum = 1

    return render(request, 'film/participantlist.html', {'participants':participants, 'number':number, 'pageNum': pageNum, 'pageRange':range(1,pageNum+1),'page':page })
      
""" editFilm
Film editieren
"""      
@permission_required('portal.add_film', login_url='/user/login/')
def editFilm(request, pk = None):
    
    category = Category()
    film = Film()
    participant = Participant()
    form = FilmForm()
    # Zusaetzliche Forms fuer Anlegen Mitwirkender/Kategorie per Ajax
    form2 = ParticipantForm()
    form3 = CategoryForm()
    
    # neuer Film?
    new = False
    if pk == None:
        page_title = 'Neuen Film anlegen'
        new = True       
    else:
        film = get_object_or_404(Film, pk = pk)
        page_title = 'Film bearbeiten'
        
    if request.method == 'POST':
        form = FilmForm(request.POST, instance = film)

        if request.POST.get('submit'):
            if form.is_valid():
                newfilm = form.save(commit = False)
                # ist ein Cover hochgeladen worden?
                try:
                    newfilm.cover = request.FILES['cover']
                except:
                    pass
                newfilm.save()
                form.save_m2m()
                messages.success(request, 'Film wurde gespeichert.')
                return HttpResponseRedirect(('/film/films/1/'))
            else:
                messages.error(request, (u'Die Eingabe ist nicht vollstaendig korrekt.'))
        elif request.POST.get('delete'):
            film.delete()
            messages.success(request, 'Film wurde entfernt.')
            return HttpResponseRedirect(('/film/films/1/'))
        else:
            messages.error(request, 'Etwas lief schief.')
            return HttpResponseRedirect(('/film/films/1/'))
    else:
        form = FilmForm(instance = film)
        context = {'page_title':page_title,'film_form': form, 'participant_form': form2, 'category_form': form3,'new':new,}
        return render(request, 'film/film.html', context)

""" films
Anzeige der Filmliste
"""        
def films(request, page = '1'):

    elements_per_page = settings.PAGINATION_ELEM_PER_PAGE
    
    # sind Filter/Suchbegriff gesetzt?
    search = '' 
    if "search" in request.session and request.session["search"] != None:
        search = request.session["search"]
    filter = '' 
    if "filter" in request.session and request.session["filter"] != None:
        filter = request.session["filter"]
     
    # alle Filme - Suchbegriff beruecksichtigen     
    allFilms = Film.objects.all().filter(title__contains=search)
    
    # Sortierung - Default: Titel
    if "orderFilmsBy" in request.session:
        orderBy = request.session["orderFilmsBy"]
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
    o = orderBy
    if reverseOrder:
        orderImg = 'up'
    else:
        o = '-'+orderBy
        
    # Filme als Liste
    orderFilms = list(allFilms)
    if orderBy == 'rating':
        orderFilms.sort( key=rating,reverse = not reverseOrder )
    else:
        orderFilms = list(allFilms.order_by(o))
    
    # Filter
    if filter != '':
        for b in orderFilms[:]: 
            own = FilmOwning.objects.all().filter(film_id = b.id).filter(user_id=request.user.id)
            if  own.count() > 0 and own[0].own == 'Ja':
                if filter == 'nicht gesehen':
                    orderFilms.remove(b)
            else:
                if filter == 'gesehen':
                    orderFilms.remove(b)

    
    
    number = len(orderFilms)
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
    films = orderFilms[start:end]
 
    context = {'TitelSearch':search,'orderBy':orderBy,'films':films, 'number':number, 'pageNum': pageNum,'orderImg':orderImg, 'pageRange':range(1,pageNum+1),'page':page,'filter':filter,'curPage':'films', }
    return render(request, 'film/filmlist.html', context)

""" rating
Durchschnittliche Bewertung ermitteln
"""
def rating( film ):
    return film.orderRating()

""" setOrderFilms
Sortierung in Session setzen
"""
def setOrderFilms(request, order):  
    if "orderFilmsBy" in request.session:
        if order == request.session["orderFilmsBy"]:  
            if "reverse" in request.session:
                request.session["reverse"] = not request.session["reverse"]
            else:
                request.session["reverse"] = True
    request.session["orderFilmsBy"] = order
    return HttpResponseRedirect(('/film/films/1/'))
  
""" setFilmFilter
Suchbegriff in Session setzen
"""  
def setFilmSearch(request):
    request.session["search"] = request.POST.get('search', '')
    return HttpResponseRedirect(('/film/films/1/'))

""" setFilmFilter
Filter in Session setzen
"""
def setFilmFilter(request):
    request.session["filter"] = request.POST.get('filter', '')
    return HttpResponseRedirect(('/film/films/1/'))

""" commentFilm
Film kommentieren
"""    
def commentFilm(request, pk = None):
    comment = FilmComment(user_id=request.user.id, film_id=pk)
    if request.method == 'POST':
        form = FilmCommentForm(request.POST, instance = comment)
     
        if form.is_valid() :
            form.save()
        else:
            messages.error(request, 'Kommentar konnte nicht gespeichert werden.')
    return HttpResponseRedirect(('/film/detail/'+pk+'/'))

""" deleteComment
Kommentar loeschen
"""
def deleteComment(request, pk = None, bpk = None):
    comment = FilmComment

    if pk == None:
        page_title = 'Etwas ist schief '
    else:
        comment = get_object_or_404(FilmComment, pk = pk)

        comment.delete()
        messages.success(request, 'Kommentar wurde geloescht.')
        if bpk == None:
            return HttpResponseRedirect(('/film/films/1/'))
        else:
            return HttpResponseRedirect(('/film/detail/'+bpk+'/'))

""" ownFilm
Festlegen ob Film gesehen und besessen wurde
"""       
def ownFilm(request, pk = None):
    owning = FilmOwning(user_id=request.user.id, film_id=pk)
    if request.method == 'POST':
        form = FilmOwningForm(request.POST, instance = owning)
        if form.is_valid():
            form.save()
        else:
            messages.error(request, 'Beim speichern ist ein Fehler aufgetreten.')
    return HttpResponseRedirect(('/film/detail/'+pk+'/'))
    
""" rateFilm
Film bewerten
"""     
def rateFilm(request, pk = None):
    rating = FilmRating(user_id=request.user.id, film_id=pk)
    if request.method == 'POST':
        form = FilmRatingForm(request.POST, instance = rating)
       
        if form.is_valid() :
            try:
                form.save()
            except:
                pass
        else:
            messages.error(request, 'Bewertung konnte nicht gespeichert werden.')
    return HttpResponseRedirect(('/film/detail/'+pk+'/'))
    
""" detailFilm
Detailansicht zu einem Film
"""   
def detailFilm(request, pk = None):
    form = FilmCommentForm()
    form2 = FilmRatingForm()
    form3 = FilmOwningForm()
    film = get_object_or_404(Film, pk = pk)
    filmRatings = FilmRating.objects.all()
    comments = FilmComment.objects.all().filter(film_id=pk).order_by('-commentdate')
    count = filmRatings.filter(film_id=pk).count()
    ownRating = filmRatings.filter(user_id=request.user.id, film_id = pk)

    try:
        ownRating = ownRating[0]
    except:
        ownRating = 0

    owning = FilmOwning.objects.all().filter(user_id=request.user.id, film_id = pk)

    try:
        owning = owning[0]
    except:
        owning = 0
        
    context = {'film': film,'form': form,'form2': form2, 'form3': form3,'comments':comments,'count':count, 'ownRating': ownRating, 'owning': owning}
    return render(request, 'film/film_detail.html', context)
  
""" addFilmCategory
Anlegen einer Kategorie per Ajax
"""
def addFilmCategory(request):
    category = Category()
    form = CategoryForm(request.POST, instance = category)
    if request.POST:
        if form.is_valid():
            form.save()   
    return HttpResponse()    
    
""" addFilmParticipant
Anlegen eines Mitwirkenden per Ajax
"""
def addFilmParticipant(request):
    participant = Participant()
    form = ParticipantForm(request.POST, instance = participant)
    if request.POST:
        if form.is_valid():
            form.save()
    return HttpResponse()
  
