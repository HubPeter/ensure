from django.contrib import admin

# Register your models here.
from main.models import *
from main.modeladmin import *

# user
#dmin.site.register(User)

# disaster
admin.site.register( DisasterStatus, DisasterStatusAdmin)
admin.site.register( DisasterType ,DisasterTypeAdmin )
admin.site.register( Category ,CategoryAdmin )
admin.site.register( Material ,MaterialAdmin )

# global data
admin.site.register( City, CityAdmin )
admin.site.register( Province, ProvinceAdmin )
admin.site.register( Store, StoreAdmin )
