from django.conf.urls import patterns, include, url
from views import *

urlpatterns = patterns('', 
                       url(r'^$', StatusScheduler.as_view(), name = 'status-scheduler'),
                       url(r'^cit-list$', ListCityView.as_view(), name = 'city-list',),
                       url(r'^city-new$', CreateCityView.as_view(), name = 'city-new'),
                       url(r'^status-scheduler$', StatusScheduler.as_view(), name = 'status-scheduler')
                       #url(r'^search$', SearchCityView.as_view(), name = 'city-search')
                       )
