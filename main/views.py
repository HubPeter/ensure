#-*- coding: utf-8 -*-
from django.shortcuts import render, redirect
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse

from django.template import loader, Context

from django.views.generic import View
from django.views.generic import CreateView
from django.views.generic import ListView

from main.models import *
from main.forms import *

import pdb

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
class StatusScheduler(View):
    template_name = 'status_scheduler.html'
    def post(self, request):
        form = SearchForm( request.POST )
        if form.is_valid():
            print form.cleaned_data
            # query all avaliable meterials
            disastertype = DisasterType.objects\
                .get( id = int(request.POST['disastertype']))
            disasterstatus = DisasterStatus.objects\
                .get( id = int(request.POST['disasterstatus']))
            city = City.objects.get( id = int(request.POST['city']))
            # 筛选精确的物资类别
            category = Category.objects.get( id = int(request.POST['category']))
        
            # 计算响应物资的需求
            #
            #
            #
            # 很多公式
            meterials = Material.objects.all()
            context = {'form':form, 'materials':meterials}
            return render(request, self.template_name, context)
        else:
            return HttpResponse('请输入正确的参数')

    def get(self, request):
        form = SearchForm()
        context = {'form':form, 'materials':[]}
        return render(request, self.template_name, context)

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
