from django.contrib import admin
from django.forms import ModelForm

# Register your models here.
from main.models import *
from main.forms import *

admin.site.register(Store, StoreAdmin)
admin.site.register(Province, ProvinceAdmin)
admin.site.register(City, CityAdmin)
