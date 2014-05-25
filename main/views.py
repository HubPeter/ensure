#-*- coding: utf-8 -*-
from django.shortcuts import render
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse

from django.template import loader, Context

from django.views.generic import View
from django.views.generic import CreateView
from django.views.generic import ListView

from main.models import User
from main.models import City

# user login
class UserLoginVIew(View):
    def post(self, request):
        username = request.POST['username']
        password = request.POST['password']
        '''
        if (username != '') && (username != None) \
                && (password != '') \
                && (password != None):
            user = User.objects.get( username = username,\
                                         password = password)
            if user != None:
                return 'success'
            else:
                return 'failed'
        else:
            return 'failed'
            '''

# scheduler



# city-search
class ListCityView(ListView):
    model = City
    template_name = 'city_list.html'
    def post(self, request):
        name = request.POST['name']
        results = City.objects.filter(name=name)
        context = Context({'object_list':results, 'name':name})
        return render(request, self.template_name, context)
         

class CreateCityView(CreateView):
    model = City
    template_name = 'edit_city.html'

    def get_success_url(self):
        return reverse('city-list')
