from django.conf.urls import patterns, include, url
from views import ListCityView
from views import CreateCityView

urlpatterns = patterns('', 
                       url(r'^$', ListCityView.as_view(), name = 'city-list',),
                       url(r'^new$', CreateCityView.as_view(), name = 'city-new')
                       #url(r'^search$', SearchCityView.as_view(), name = 'city-search')
                       )
