from django.conf.urls import patterns, urlfrom film import viewsurlpatterns = patterns('',    url(r'^addparticipant/$', views.addParticipant, name='addParticipant'),    url(r'^participants/$', views.participants, name='participantlist'),    url(r'^participants/(?P<page>[0-9]+)?/$', views.participants, name='participants'),    url(r'^editparticipant/(?P<pk>[0-9]+)/$', views.addParticipant, name='editParticipant'),    url(r'^add/$', views.editFilm, name='addFilm'),    url(r'^edit/(?P<pk>[0-9]+)/$', views.editFilm, name='editFilm'),    url(r'^detail/(?P<pk>[0-9]+)/$', views.detailFilm, name='detailFilm'),    url(r'^film/comment/(?P<pk>[0-9]+)/$', views.commentFilm, name='commentFilm'),    url(r'^film/deleteComment/(?P<pk>[0-9]+)/(?P<bpk>[0-9]+)/$', views.deleteComment, name='deleteComment'),    url(r'^film/rate/(?P<pk>[0-9]+)/$', views.rateFilm, name='rateFilm'),    url(r'^film/own/(?P<pk>[0-9]+)/$', views.ownFilm, name='ownFilm'),    url(r'^films/$', views.films, name='filmlist'),    url(r'^films/(?P<page>[0-9]+)?/$', views.films, name='films'),    url(r'^films/(?P<order>[a-z]+)?/$', views.setOrderFilms,  name='filmsrating'),    url(r'^filmsearch/$', views.setFilmSearch,  name='filmsearch'),    url(r'^filmsfilter/$', views.setFilmFilter,  name='filmsfilter'),    url(r'^films/category/add$', views.addFilmCategory,  name='film_category_add'),    url(r'^films/participant/add$', views.addFilmParticipant,  name='film_participants_add'),)