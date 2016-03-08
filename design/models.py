from django.db import models

# Create your models here.
class Design(models.Model):
	design_title=models.CharField(max_length=200)
	design_img_url=models.URLField(null=True,blank=True)
	design_source=models.CharField(max_length=20)
	design_link=models.URLField(null=True)
	design_date=models.DateTimeField(auto_now_add=True)
	def __unicode__(self):
		return self.design_title;