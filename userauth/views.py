"""
view userauth app
Objektorientierte Scriptsprachen WS 2014
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.template import RequestContext
from forms import RegisterForm , ProfileForm, MsgForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.shortcuts import render, get_object_or_404
from models import Msg
from django.conf import settings

""" Registrierung 
"""
def register(request, next_page_name=None):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Sie haben sich erfolgreich registriert und koennen sich jetzt einloggen.')
            return HttpResponseRedirect('/user/login/')
    else:
        form = RegisterForm()
    return render(request, 'userauth/register.html', {'register_form': form})
        
        
""" Profil bearbeiten 
"""       
@login_required        
def profile(request, next_page_name=None):
    if request.method == 'POST':
        form = ProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, 'Profil wurde aktualisiert.')
    else:
        form = ProfileForm(instance=request.user)
    return render(request, 'userauth/profile.html', {'profile_form': form,'curPage':'profile',})

""" Anzeige User Liste 
"""
def users(request, page = 1, search = ''):
    elements_per_page = settings.PAGINATION_ELEM_PER_PAGE
    
    allUsers = User.objects.all().order_by('username').filter(username__contains=search).filter(first_name__contains=search).filter(last_name__contains=search)

    page = int(page)
    
    start = (page-1) * elements_per_page
    end = start + elements_per_page

    users = allUsers[start:end]
    number = allUsers.count()
            
    pageNum = int(round(number / float(elements_per_page),0))
    
    # abgerundet?
    if pageNum < round(number / float(elements_per_page),1):
        pageNum = pageNum+1
    # mindestens eine Seite zeigen
    if pageNum == 0:
        pageNum = 1

    return render(request, 'userauth/userlist.html', {'users':users, 'number':number, 'pageNum': pageNum, 'pageRange':range(1,pageNum+1),'page':page })

""" Aktivieren und deaktivieren von Benutzern 
"""    
def userAktivate(request, id, page):
    user = get_object_or_404(User, pk = id)
    user.is_active = not user.is_active 
    user.save()
    return HttpResponseRedirect(('/user/users/'+page+'/'))


""" Nachrichten an andere Benutzer schreiben 
"""
@login_required        
def writeMsg(request):
    
    allMsg = Msg.objects.all().filter(to_user = request.user.id ).order_by('-msgdate')
    msg = Msg(from_user=request.user)
    form = MsgForm()
    form.fields['to_user'].queryset = User.objects.all().exclude(id=request.user.id)
    if request.method == 'POST':
        form = MsgForm(request.POST, instance = msg)    
        if form.is_valid() :
            form.save()
            messages.success(request, 'Nachricht gesendet.')
            return HttpResponseRedirect('/user/msg/')
        else:
            messages.error(request, 'Nachricht konnte nicht verschickt werden.')
    return render(request, 'userauth/write_msg.html', {'form': form, 'allMsg' : allMsg,'curPage':'msg',} )
         
""" Nachrichten loeschen 
"""  
def deleteMsg(request, mid):
    msg = get_object_or_404(Msg, pk = mid)
    msg.delete()
    messages.success(request, 'Nachricht entfernt.')
    return HttpResponseRedirect('/user/msg/')


