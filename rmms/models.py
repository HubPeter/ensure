#-*- coding: utf-8 -*-

from django.db import models
import datetime

# Create your models here.

class Province(models.Model):
    name = models.CharField( verbose_name = '省', max_length = 10, unique = True )
    class Meta:
        verbose_name = '省'
        verbose_name_plural = '省级行政单位列表'
    def __unicode__(self):
        return self.name

class City(models.Model):
    name = models.CharField( verbose_name = '城市', max_length = 20 )
    province = models.ForeignKey( Province, verbose_name = '省' )
    population = models.IntegerField( verbose_name = '人口', help_text = '单位：万' )
    timezone = models.IntegerField( verbose_name = '时区', help_text = '一个代表时区的整数，比如：东八区填8' )
    area_factor = models.IntegerField( verbose_name = '地区系数' )
    density_level = models.IntegerField( verbose_name = '人口密度等级' )
    class Meta:
        verbose_name = '城市'
        verbose_name_plural = '城市列表'
        unique_together = (("name", "province"),)
    def __unicode__(self):
        return self.name
    def get_full_name(self):
        return unicode(self.province) + '-' + self.name
    full_name = property(get_full_name)

class Store(models.Model):
    name = models.CharField( verbose_name = '仓库名称', max_length = 50 )
    city = models.ForeignKey( City, verbose_name = '城市' )
    address = models.CharField( verbose_name = '地址', max_length = 200, help_text = '填写详细的地址' )
    coordinate = models.CharField( verbose_name = '坐标', max_length = 50, unique = True )
    comment  = models.CharField( verbose_name = '备注', max_length = 100, blank = True, help_text = '可以不填' )
    class Meta:
        verbose_name = '仓库'
        verbose_name_plural = '仓库列表'
    def __unicode__(self):
        return self.name

class DisasterSpecies(models.Model):
    name = models.CharField( verbose_name = '灾害类型', max_length = 20, unique = True )
    class Meta:
        verbose_name = '灾害类型'
        verbose_name_plural = '灾害类型列表'
    def __unicode__(self):
        return self.name

class Disaster(models.Model):
    name = models.CharField( verbose_name = '灾害事件', max_length = 50, help_text = '如：汶川地震' )
    city = models.ForeignKey( City, verbose_name = '城市')
    species = models.ForeignKey( DisasterSpecies, verbose_name = '灾害类型')
    level = models.IntegerField( verbose_name = '震级' )
    epicentre = models.CharField( verbose_name = '震源', max_length = 100 )
    epicentre_depth = models.IntegerField( verbose_name = '震源深度', help_text = '单位：米' )
    occur_date = models.DateField( verbose_name = '发生时间' )
    class Meta:
        verbose_name = '灾害'
        verbose_name_plural = '灾害列表'
    def __unicode__(self):
        return self.name

class Category1(models.Model):
    name = models.CharField( verbose_name = '一级分类', max_length = 20, unique = True )
    class Meta:
        verbose_name = '物资一级分类'
        verbose_name_plural = '物资一级分类列表'
    def __unicode__(self):
        return self.name

class Category2(models.Model):
    name = models.CharField( verbose_name = '二级分类', max_length = 50, unique = True )
    super_category = models.ForeignKey( Category1, verbose_name = '所属一级分类' )
    class Meta:
        verbose_name = '物资二级分类'
        verbose_name_plural = '物资二级分类列表'
    def __unicode__(self):
        return self.name

class Category3(models.Model):
    name = models.CharField( verbose_name = '三级分类', max_length = 50, unique = True )
    super_category = models.ForeignKey( Category2, verbose_name = '所属二级分类' )
    class Meta:
        verbose_name = '物资三级分类'
        verbose_name_plural = '物资三级分类列表'
    def __unicode__(self):
        return self.name

class Formula(models.Model):
    formula = models.CharField( verbose_name = '物资需求量公式', max_length = 100, unique = True )
    class Meta:
        verbose_name = '物资需求量公式'
        verbose_name_plural = '物资需求量公式列表'
    def __unicode__(self):
        return self.formula

class TransportWay(models.Model):
    name = models.CharField( verbose_name = '运输方式', max_length = 30, unique = True )
    class Meta:
        verbose_name = '运输方式'
        verbose_name_plural = '运输方式列表'
    def __unicode__(self):
        return self.name

class SourceWay(models.Model):
    name = models.CharField( verbose_name = '物资筹措方式', max_length = 20, unique = True )
    class Meta:
        verbose_name = '物资筹措方式'
        verbose_name_plural = '物资筹措方式列表'
    def __unicode__(self):
        return self.name

class Material(models.Model):
    name = models.CharField( verbose_name = '物资名称', max_length = 50, unique = True )
    category = models.ForeignKey( Category3, verbose_name = '物资种类' )
    amountunit = models.CharField( verbose_name = '计量单位', max_length = 10 )
    shelf_life = models.IntegerField( verbose_name = '保质期', help_text = '单位：月' )
    formula = models.ForeignKey( Formula, verbose_name = '需求量计算公式' )
    transport_way = models.ForeignKey( TransportWay, verbose_name = '运输方式' )
    require_amount = models.IntegerField( verbose_name = '需求量', blank = True )
    #require_amount为隐藏列，不提供修改接口，检索时暂时存储物资需求量
    class Meta:
        verbose_name = '物资'
        verbose_name_plural = '物资列表'
    def __unicode__(self):
        return self.name

class MaterialStore(models.Model):
    name = models.ForeignKey( Material, verbose_name = '物资名称' )
    store = models.ForeignKey( Store, verbose_name = '贮存仓库' )
    amount = models.IntegerField( verbose_name = '贮存量', help_text = '计量单位在物资列表中该物资的属性中' )
    production_date = models.DateField( verbose_name = '生产日期' )
    source_way = models.ForeignKey( SourceWay, verbose_name = '物资来源' )
    class Meta:
        verbose_name = '物资存储状况'
        verbose_name_plural = '物资存储状况列表'
        ordering = ['name']
        unique_together = (("name", "store"),)
    def __unicode__(self):
        return unicode(self.name)
    def under_warranty(self):
        return self.production_date <= datetime.date.today() < self.production_date + datetime.timedelta( days = self.name.shelf_life * 30 )
    under_warranty.boolean = True
    under_warranty.short_description = '在保质期内'

class RescueStage(models.Model):
    name = models.CharField( verbose_name = '应急响应阶段', max_length = 20, unique = True )
    materials = models.ManyToManyField( Material, verbose_name = '物资需求列表' )
    class Meta:
        verbose_name = '应急响应阶段'
        verbose_name_plural = '应急响应阶段列表'
    def __unicode__(self):
        return self.name
