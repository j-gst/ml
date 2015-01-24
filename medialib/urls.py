"""
URLs medialib Projekt
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.http import  HttpResponseRedirect
from django.conf import settings
import settings

urlpatterns = patterns('',
    url(r'^$', 'medialib.views.index', name='home'),
    url(r'^film/', include('film.urls')),
    url(r'^book/', include('book.urls')),
    url(r'^user/', include('userauth.urls')),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
                 {'document_root': settings.MEDIA_ROOT}),
)
