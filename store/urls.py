from django.conf.urls import url
from . import views
urlpatterns = [


    url(r'^book/search/(?P<key>\s+)$', views.getBookBy),
    url(r'^book/$', views.getBooks),
    url(r'^book/(?P<book_id>[0-9]+)$', views.getBook),
    url(r'^book/(?P<book_id>[0-9]+)/(?P<state>[0-9]+)$',views.wantToRead),
    url(r'^book/rate/(?P<book_id>[0-9]+)/(?P<rate>[0-9]+)$',views.rate),
    url(r'^author/$', views.getAuthors),
    url(r'^author/(?P<author_id>[0-9]+)$', views.getAuthor),
    url(r'^author/follow/(?P<author_id>[0-9]+)$', views.followAuthor),
    url(r'^author/unfollow/(?P<author_id>[0-9]+)$', views.unFollowAuthor),
    url(r'^register/$', views.register, name='register'),
    url(r'^login/$', views.login, name='login'),
    url(r'^home/$', views.index, name='index'),
    url(r'^$', views.index, name='index'),
    url(r'^myArea/$', views.goArea, name='area'),
    url(r'^logout/$', views.exit, name='area'),
    url(r'^book/notify/(?P<num>[0-9]+)/$', views.bookNotify, name='bookNotify'),
url(r'^author/notify/(?P<num>[0-9]+)/$', views.authorNotify, name='authorNotify')
]
