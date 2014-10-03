from django.conf.urls import patterns, url
from views import *

urlpatterns = patterns('',
    #url( r'^$', views.rmmshome, name = 'rmmshome' ),
    url( r'^$', Requirement.as_view(), name = 'requirement' ),
    url( r'^free_search/$', FreeSearch.as_view(), name = 'free_search' ),
)
