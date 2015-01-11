from django.contrib.auth.forms import UserCreationForm
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.template import RequestContext
from forms import RegisterForm , ProfileForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages





def register(request, next_page_name=None):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            if next_page_name is None:
                next_page = '/'
            else:
                next_page = reverse(next_page_name)
            return HttpResponseRedirect(next_page)
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