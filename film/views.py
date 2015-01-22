from django.contrib import messages
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from film.models import *
from film.forms import *
from django.contrib.auth.decorators import permission_required
from django.db.models import Avg
from django.conf import settings


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
    
    
        
@permission_required('portal.add_film', login_url='/user/login/')
#Beate 02.01.2015
def editFilm(request, pk = None):
    
    category = Category()
    film = Film()
    participant = Participant()
    form = FilmForm()
    form2 = ParticipantForm()
    form3 = CategoryForm()
    
    
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

    
    
    
            
def films(request, page = '1',  filter = None):

    elements_per_page = settings.PAGINATION_ELEM_PER_PAGE
    
    search = '' 
    if "search" in request.session and request.session["search"] != None:
        search = request.session["search"]
    
    filter = '' 
    if "filter" in request.session and request.session["filter"] != None:
        filter = request.session["filter"]
          
    allFilms = Film.objects.all().filter(title__contains=search)
    
    
    if "orderFilmsBy" in request.session:
        orderBy = request.session["orderFilmsBy"]
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
    orderFilms = list(allFilms.order_by(o))
    if orderBy == 'rating':
        orderFilms.sort( key=rating,reverse = not reverseOrder )
    
    debStr = 'Remove: '
    #filter = ''
    if filter != '':
        for b in orderFilms[:]:
            
            own = FilmOwning.objects.all().filter(film_id = b.id).filter(user_id=request.user.id)
            

            
            
            if  own.count() > 0 and own[0].own == 'Ja':
                if filter == 'nicht gelesen':
                    orderFilms.remove(b)
            else:
                if filter == 'gelesen':
                    orderFilms.remove(b)

    
    
    number = len(orderFilms)
    pageNum = int(round(number / float(elements_per_page),0))
    
    # abgerundet?
    if pageNum < round(number / float(elements_per_page),1):
        pageNum = pageNum+1
    
    if pageNum == 0:
        pageNum = 1
    

    
    start = (page-1) * elements_per_page
    end = start + elements_per_page
    films = orderFilms[start:end]
 
    context = {'TitelSearch':search,'orderBy':orderBy,'films':films, 'number':number, 'pageNum': pageNum,'orderImg':orderImg, 'pageRange':range(1,pageNum+1),'page':page,'filter':filter,'curPage':'films', }
    return render(request, 'film/filmlist.html', context)

    
    
    
    
def rating( film ):
    return film.orderRating()


def setOrderFilms(request, order):  
    if "orderFilmsBy" in request.session:
        if order == request.session["orderFilmsBy"]:  
            if "reverse" in request.session:
                request.session["reverse"] = not request.session["reverse"]
            else:
                request.session["reverse"] = True
    request.session["orderFilmsBy"] = order
    return HttpResponseRedirect(('/film/films/1/'))

    
    
    
    
def setFilmSearch(request):

    request.session["search"] = request.POST.get('search', '')
    return HttpResponseRedirect(('/film/films/1/'))

def setFilmFilter(request):

    request.session["filter"] = request.POST.get('filter', '')
    return HttpResponseRedirect(('/film/films/1/'))


    
    
    
def commentFilm(request, pk = None):
    
    comment = FilmComment(user_id=request.user.id, film_id=pk)
    if request.method == 'POST':
        form = FilmCommentForm(request.POST, instance = comment)
     
        if form.is_valid() :
            form.save()
        else:
            messages.error(request, 'Kommentar konnte nicht gespeichert werden.')
    return HttpResponseRedirect(('/film/detail/'+pk+'/'))

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






def ownFilm(request, pk = None):
    owning = FilmOwning(user_id=request.user.id, film_id=pk)
    if request.method == 'POST':
        form = FilmOwningForm(request.POST, instance = owning)

        if form.is_valid():
            form.save()
        else:
            messages.error(request, 'Beim speichern ist ein Fehler aufgetreten.')
    return HttpResponseRedirect(('/film/detail/'+pk+'/'))
    
    
    
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
    
    
    
def detailFilm(request, pk = None):
    form = FilmCommentForm()
    form2 = FilmRatingForm()
    form3 = FilmOwningForm()
    film = get_object_or_404(Film, pk = pk)
    filmRatings = FilmRating.objects.all()
    comments = FilmComment.objects.all().filter(film_id=pk).order_by('-commentdate')
    count = filmRatings.filter(film_id=pk).count()
    ownRating = filmRatings.filter(user_id=request.user.id, film_id = pk)
    #rated = False if ownRating == 0 else  True
    
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
  
    
def addFilmCategory(request):
    category = Category()
    form = CategoryForm(request.POST, instance = category)
    if request.POST:
        if form.is_valid():
            form.save()   
    return HttpResponseRedirect(('/film/add/'))        

def addFilmParticipant(request):
    participant = Participant()
    form = ParticipantForm(request.POST, instance = participant)
    if request.POST:
        if form.is_valid():
            form.save()
    return HttpResponseRedirect(('/film/add/'))     
