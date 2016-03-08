from django.db import models

# Create your models here.
class News(models.Model):
	n_title=models.CharField(max_length=200)
	n_desc=models.CharField(max_length=1000,blank=True)
	n_img_url=models.URLField(null=True,blank=True)
	n_source=models.CharField(max_length=20)
	n_link=models.URLField(null=True)
	n_date=models.DateTimeField(auto_now_add=True)
	def __unicode__(self):
		return self.n_title;