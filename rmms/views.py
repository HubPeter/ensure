#-*- coding: utf-8 -*-

from django.shortcuts import render
from django.views.generic import View
from django.shortcuts import render
from django.http import HttpResponse
from rmms.models import *
from django.forms import *

# Create your views here.

class RequirementForm(Form):
    disaster = ModelChoiceField( queryset = Disaster.objects.all(), empty_label = '灾害' )
    rescue_stage = ModelChoiceField( queryset = RescueStage.objects.all(), empty_label = '应急响应阶段' )

class FreeSearchForm(Form):
    store = ModelChoiceField( queryset = Store.objects.all(), empty_label = '所有仓库' )
    category = ModelChoiceField( queryset = Category3.objects.all(), empty_label = '所有种类' )
    transport_way = ModelChoiceField( queryset = TransportWay.objects.all(), empty_label = '所有运输方式' )
    source_way = ModelChoiceField( queryset = SourceWay.objects.all(), empty_label = '所有筹措方式' )

class Requirement(View):
    template_name = 'requirement.html'
    def post(self, request):
        form = RequirementForm( request.POST )
        if form.is_valid():
            disaster = form.cleaned_data['disaster']
            rescue_stage = form.cleaned_data['rescue_stage']
            materials = rescue_stage.materials.all()
            for material in materials:
                if ( unicode(material.formula) == u'0.02*灾区总人口' ):
                    material.require_amount = int(0.02 * disaster.city.population * 10000)
                    material.save()
                elif ( material.formula.formula == u"地区系数*2*灾区总人口*10" ):
                    material.require_amount = int(disaster.city.area_factor * 2 * disaster.city.population * 10000 * 10)
                    material.save()
                else:
                    material.require_amount = 3427
                    material.save()
            context = {'form':form, 'materials':materials, 'disaster':disaster}
            return render( request, self.template_name, context )
        else:
            if (len(form.cleaned_data) > 0):
                for k in form.cleaned_data:
                    if (k == "disaster"):
                        context = {'form':form, 'error_message':"请选择应急阶段！"}
                        return render( request, self.template_name, context )
                    else:
                        context = {'form':form, 'error_message':"请选择灾害事件！"}
                        return render( request, self.template_name, context )
            else:
                context = {'form':form, 'error_message':"请选择灾害事件和应急阶段！"}
                return render( request, self.template_name, context )
    def get(self, request):
        form = RequirementForm()
        context = {'form':form, 'materials':[], 'disaster':[]}
        return render( request, self.template_name, context )

class FreeSearch(View):
    template_name = 'free_search.html'
    def post(self, request):
        form = FreeSearchForm( request.POST )
        material_store = MaterialStore.objects.all()
        if form.is_valid():
            store = form.cleaned_data['store']
            category = form.cleaned_data['category']
            transport_way = form.cleaned_data['transport_way']
            source_way = form.cleaned_data['source_way']
            material_store = material_store.filter(store = store).filter(name__category = category).filter(name__transport_way = transport_way).filter(source_way = source_way)
        else:
            for k in form.cleaned_data:
                if (k == "store"):
                    store = form.cleaned_data[k]
                    material_store = material_store.filter(store = store)
                if (k == "category"):
                    category = form.cleaned_data[k]
                    material_store = material_store.filter(name__category = category)
                if (k == "transport_way"):
                    transport_way = form.cleaned_data[k]
                    material_store = material_store.filter(name__transport_way = transport_way)
                if (k == "source_way"):
                    source_way = form.cleaned_data[k]
                    material_store = material_store.filter(source_way = source_way)
        context = {'form':form, 'material_store':material_store}
        return render( request, self.template_name, context )
    def get(self, request):
        form = FreeSearchForm()
        context = {'form':form, 'material_store':[], 'disaster':[]}
        return render( request, self.template_name, context )
