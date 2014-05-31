#-*- coding: utf-8 -*-
from django.db.models import Model\
    ,CharField, ForeignKey, SmallIntegerField\
    , IntegerField
    

class User(Model):
	username = CharField(\
		max_length = 30,\
			primary_key = True,\
			unique = True)
	password = CharField(max_length = 30)
	def __unicode__(self):
		return self.username

class Province( Model ):
	name = CharField( max_length = 100 )
	# to generate string that represent this object
	def __unicode__(self):
		return self.name

class City( Model ):
	name = CharField( max_length = 100 )
	province = ForeignKey( Province )
	def __unicode__(self):
		return self.name

class Store( Model ):
	# 名称
	name = CharField( max_length = 100 )
	# 所在城市
	city = ForeignKey( City )
	# 具体位置
	location = CharField( max_length = 200 )
	# 坐标
	coordinate = CharField( max_length = 100 )
	comment  = CharField( max_length = 200 )
	def __unicode__(self):
		return self.name

class DisasterType( Model ):
	# 灾害名称
	name = CharField( max_length = 20 )
	def __unicode__(self):
		return self.name

class DisasterStatus( Model ):
	name = CharField( max_length = 20 )
	def __unicode__(self):
		return self.name

class Disaster( Model ):
	city = ForeignKey( City )
	type = ForeignKey( DisasterType )
	status = ForeignKey( DisasterStatus )
	def __unicode__(self):
		return self.city + '-' + self.type

class Category( Model ):
	name = CharField( max_length = 50 )
	def __unicode__(self):
		return self.name

class Material( Model ):
	name = CharField( max_length = 50 )
	category = ForeignKey( Category )
	store = ForeignKey( Store )
	count = IntegerField()
	def __unicode__(self):
		return self.name + '-' + str(self.count)

class DM( Model ):
	disastertype = ForeignKey( DisasterType )
	
	
