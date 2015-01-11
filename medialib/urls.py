from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.http import  HttpResponseRedirect
from django.conf import settings
import settings
urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'medialib.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    (r'^$', lambda r: HttpResponseRedirect('portal/')),
    url(r'^portal/', include('portal.urls')),
    url(r'^user/', include('userauth.urls')),
    url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
                 {'document_root': settings.MEDIA_ROOT}),
)
