from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView

from userauth import views

urlpatterns = patterns(
    url(r'^users/$', views.users, name='userlist'),
    url(r'^users/(?P<page>[0-9]+)?/$', views.users, name='users'),
    url(r'^activate/(?P<id>[0-9]+)?/(?P<page>[0-9]+)?/$', views.userAktivate, name='users_active_inactive'),
)

urlpatterns += patterns('django.contrib.auth.views',
    url(r'^login/$', 'login', {'template_name': 'userauth/login.html'},
        name='userauth_login'),
    url(r'^logout/$', 'logout', {'next_page': '/portal/books/'},
        name='userauth_logout'),
    url(r'^password_change/$', 'password_change',
         {'post_change_redirect' : '/user/profile/',
         'template_name': 'userauth/password_change_form.html'},
        name='userauth_password_change'),
    url(r'^password_change_done/$', 'password_change_done',
        {'template_name': 'userauth/password_change_done.html'},
        name='userauth_password_change_done'),
)




urlpatterns += patterns('',
    url(r'^register/$', 'userauth.views.register',
        {'next_page_name': 'userauth_register_done'},
        name='userauth_register'),
    url(r'^profile/$', 'userauth.views.profile',
        {'next_page_name': 'userauth_register_done'},
        name='userauth_profile'),        
        
    url(r'^welcome/$',
        TemplateView.as_view(template_name='userauth/register_done.html'),
        name='userauth_register_done')
)