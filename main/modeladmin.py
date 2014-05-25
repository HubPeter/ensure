from django.contrib import admin
from django.forms import *
import pdb

# Register your models here.
from main.models import *
from main.forms import *

# forms

class ProvinceForm(ModelForm):
	class Meta:
		model = Province
		fields = ['id', 'name']

class CityForm(ModelForm):
	province = ModelChoiceField(queryset=Province.objects.all())
		
# admin models
class ProvinceAdmin(admin.ModelAdmin):
	# fields list in change list
	list_display = ( 'name' , 'id', )
	# search field in change list
	search_fields = ( 'name' ,)
	# fields to display in edit form
	fields = ('id', 'name',  )
	admin_order_field = 'id'
	#form = ProvinceForm

class CityAdmin(admin.ModelAdmin):
	#pdb.set_trace()
	list_display = ( 'name' , 'get_province')
	# show province's name in changed list
	def get_province(self, obj):
		return obj.province.name
	get_province.short_description = 'Province'

	search_fields = ( 'name' , )
	#fields = ( 'name','province', )
	form = CityForm
	
class StoreAdmin(admin.ModelAdmin):
	list_display = ( 'name' , 'city')
	search_fields = ( 'name' , )
	fields = ('name', 'city')

# disaster
class DisasterTypeAdmin( admin.ModelAdmin ):
	list_display = ( 'name', 'id' )
	search_fields = ( 'name', )
	fields = ( 'name', )

class DisasterStatusAdmin( admin.ModelAdmin ):
	list_display = ( 'name', 'id' )
	search_fields = ( 'name', )
	fields = ( 'name', )

class CategoryAdmin( admin.ModelAdmin ):
	list_display = ( 'name', 'id' )
	search_fields = ( 'name', )
	fields = ( 'name', )

class MaterialAdmin( admin.ModelAdmin ):
	list_display = ( 'name', 'category', 'store', 'count' )
	search_fields = ( 'name', 'category__name'\
				  , 'store__name' )
	fields = ( 'name', 'category', 'store', 'count' )
			     
