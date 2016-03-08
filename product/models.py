from django.db import models

# Create your models here.
class Product(models.Model):
	p_name=models.CharField(max_length=100)
	p_link=models.URLField(null=True)
	p_desc=models.CharField(max_length=500)
	p_source=models.CharField(max_length=20)
	p_source_link=models.URLField(null=True)
	p_date=models.DateTimeField(auto_now_add=True)
	def __unicode__(self):
		return self.p_name;