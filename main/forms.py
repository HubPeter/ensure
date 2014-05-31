#-*- coding: utf-8 -*-
from django.contrib import admin
from django.forms import *

from main.models import *

# Register your models here.
from main.models import *

# 根据救援阶段，计算物资
class SearchForm(Form):
	disastertype = ModelChoiceField(\
		queryset = DisasterType.objects.all()\
			,empty_label = '灾害类型')
	city = ModelChoiceField(\
		queryset = City.objects.all()\
			,empty_label = '受灾位置')
	disasterstatus = ModelChoiceField(\
		queryset = DisasterStatus.objects.all()\
			,empty_label = '救援状态')
	category = ModelChoiceField(\
		queryset = Category.objects.all()\
			,empty_label = '需要物资类型'
		)
