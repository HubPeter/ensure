#-*- coding: utf-8 -*-

from django.contrib import admin
from rmms.models import *

# Register your models here.

class CityInline(admin.TabularInline):
    model = City
    extra = 5

class ProvinceAdmin(admin.ModelAdmin):
    #可被修改的列
    fields = ['name']
    #可被检索的列
    search_fields = ['name']
    #在类的视图里可以展示的列
    list_display = ['name']
    inlines = [CityInline]
admin.site.register(Province, ProvinceAdmin)

class CityAdmin(admin.ModelAdmin):
    fields = ['name', 'province', 'population', 'timezone', 'area_factor', 'density_level']
    search_fields = ['name', 'province__name']
    list_display = ['name', 'province', 'population', 'timezone', 'area_factor', 'density_level']
admin.site.register(City, CityAdmin)

class StoreAdmin(admin.ModelAdmin):
    fields = ['name', 'city', 'address', 'coordinate', 'comment']
    search_fields = ['name', 'city__name', 'address', 'comment']
    list_display = ['name', 'city', 'address', 'coordinate', 'comment']
admin.site.register(Store, StoreAdmin)

class DisasterSpeciesAdmin(admin.ModelAdmin):
    fields = ['name']
    search_fields = ['name']
    list_display = ['name']
admin.site.register(DisasterSpecies, DisasterSpeciesAdmin)

class RescueStageAdmin(admin.ModelAdmin):
    fields = ['name', 'materials']
    search_fields = ['name', 'materials__name']
    list_display = ['name']
admin.site.register(RescueStage, RescueStageAdmin)

class DisasterAdmin(admin.ModelAdmin):
    fields = ['name', 'city', 'species', 'level', 'epicentre', 'epicentre_depth', 'occur_date']
    search_fields = ['name', 'city__name']
    list_display = ['name', 'city', 'species', 'level', 'epicentre', 'epicentre_depth', 'occur_date']
admin.site.register(Disaster, DisasterAdmin)

class Category1Admin(admin.ModelAdmin):
    fields = ['name']
    search_fields = ['name']
    list_display = ['name']
admin.site.register(Category1, Category1Admin)

class Category2Admin(admin.ModelAdmin):
    fields = ['name', 'super_category']
    search_fields = ['name', 'super_category__name']
    list_display = ['name', 'super_category']
admin.site.register(Category2, Category2Admin)

class Category3Admin(admin.ModelAdmin):
    fields = ['name', 'super_category']
    search_fields = ['name', 'super_category__name']
    list_display = ['name', 'super_category']
admin.site.register(Category3, Category3Admin)

class FormulaAdmin(admin.ModelAdmin):
    fields = ['formula']
    search_fields = ['formula']
    list_display = ['formula']
admin.site.register(Formula, FormulaAdmin)

class TransportWayAdmin(admin.ModelAdmin):
    fields = ['name']
    search_fields = ['name']
    list_display = ['name']
admin.site.register(TransportWay, TransportWayAdmin)

class SourceWayAdmin(admin.ModelAdmin):
    fields = ['name']
    search_fields = ['name']
    list_display = ['name']
admin.site.register(SourceWay, SourceWayAdmin)

class MaterialAdmin(admin.ModelAdmin):
    fields = ['name', 'category', 'amountunit', 'shelf_life', 'formula', 'transport_way']
    search_fields = ['name', 'category__name', 'transport_way__name']
    list_display = ['name', 'category', 'amountunit', 'shelf_life', 'formula', 'transport_way']
admin.site.register(Material, MaterialAdmin)

class MaterialStoreAdmin(admin.ModelAdmin):
    fields = ['name', 'store', 'amount', 'production_date', 'source_way']
    search_fields = ['name__name', 'store__name', 'source_way__name']
    list_display = ['name', 'store', 'amount', 'production_date', 'source_way', 'under_warranty']
admin.site.register(MaterialStore, MaterialStoreAdmin)
