"""
URLs userauth app
Objektorientierte Scriptsprachen WS 2014
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView
from userauth import views

""" Userliste, Nachrichten
"""
urlpatterns = patterns(
    url(r'^users/$', views.users, name='userlist'),
    url(r'^users/(?P<page>[0-9]+)?/$', views.users, name='users'),
    url(r'^activate/(?P<id>[0-9]+)?/(?P<page>[0-9]+)?/$', views.userAktivate, name='users_active_inactive'),
    url(r'^msg/$', views.writeMsg,  name='userauth_write_msg'),
    url(r'^msg/delete/(?P<mid>[0-9]+)?/$', views.deleteMsg,  name='userauth_delete_msg'),
)

""" Login, Logout, Passwort aendern
"""
urlpatterns += patterns('django.contrib.auth.views',
    url(r'^login/$', 'login', {'template_name': 'userauth/login.html'},
        name='userauth_login'),
    url(r'^logout/$', 'logout', {'next_page': '/'},
        name='userauth_logout'),
    url(r'^password_change/$', 'password_change',
         {'post_change_redirect' : '/user/profile/',
         'template_name': 'userauth/password_change_form.html'},
        name='userauth_password_change'),
)

""" Registrierung und Profil
"""
urlpatterns += patterns('',
    url(r'^register/$', 'userauth.views.register',
        {'next_page_name': 'userauth_register_done'},
        name='userauth_register'),
    url(r'^profile/$', 'userauth.views.profile',
        {'next_page_name': 'userauth_register_done'},
        name='userauth_profile'),            
)