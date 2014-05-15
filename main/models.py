#-*- coding: utf-8 -*-

from django.db import models

# Create your models here.

class Province( models.Model ):
	name = models.CharField( max_length = 100 )
	# to generate string that represent this object
	def __unicode__(self):
		return self.name

class City( models.Model ):
	name = models.CharField( max_length = 100 )
	province = models.ForeignKey( Province )
	def __unicode__(self):
		return self.name

class Store( models.Model ):
	# 名称
	name = models.CharField( max_length = 100 )
	# 所在城市
	city = models.ForeignKey( City )
	# 具体位置
	location = models.CharField( max_length = 200 )
	# 坐标
	coordinate = models.CharField( max_length = 100 )
	comment  = models.CharField( max_length = 200 )
	def __unicode__(self):
		return self.name
