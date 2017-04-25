from django.conf.urls import url
from . import views
urlpatterns = [

    url(r'^book/$', views.getBooks),
    url(r'^book/(?P<book_id>[0-9]+)$',views.getBook),

    url(r'^author/$', views.getAuthors),
    url(r'^author/(?P<author_id>[0-9]+)$', views.getAuthor),
    url(r'^register/$', views.register, name='register')
]
