from django.contrib import admin

# Register your models here.
from main.models import *
from main.forms import *

#dmin.site.register(User)
admin.site.register( DisasterType ,DisasterTypeAdmin )
admin.site.register( City, CityAdmin )
admin.site.register( Province, ProvinceAdmin )
admin.site.register( Store, StoreAdmin )
