from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.template import RequestContext
from forms import RegisterForm , ProfileForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.shortcuts import render, get_object_or_404




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
        
        
        
@login_required        
def profile(request, next_page_name=None):
    if request.method == 'POST':
        form = ProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, 'Profil wurde aktualisiert.')
    else:
        form = ProfileForm(instance=request.user)
    return render(request, 'userauth/profile.html', {'profile_form': form})

def users(request, page = 1, search = ''):
    allUsers = User.objects.all().order_by('username').filter(username__contains=search).filter(first_name__contains=search).filter(last_name__contains=search)

    page = int(page)
    elements_per_page = 5
    start = (page-1) * elements_per_page
    end = start + elements_per_page

    users = allUsers[start:end]
    number = allUsers.count()
            
    pageNum = int(round(number / float(elements_per_page),0))
    
    # abgerundet?
    if pageNum < round(number / float(elements_per_page),1):
        pageNum = pageNum+1
    
    if pageNum == 0:
        pageNum = 1

    return render(request, 'userauth/userlist.html', {'users':users, 'number':number, 'pageNum': pageNum, 'pageRange':range(1,pageNum+1),'page':page })

def userAktivate(request, id, page):
    user = get_object_or_404(User, pk = id)
    user.is_active = not user.is_active 
    user.save()
    return HttpResponseRedirect(('/user/users/'+page+'/'))


















