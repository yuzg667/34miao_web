from django.db import models

# Create your models here.
class Development(models.Model):
	dev_title=models.CharField(max_length=200)
	dev_source=models.CharField(max_length=20)
	dev_link=models.URLField(null=True)
	dev_category=models.CharField(max_length=20)
	dev_date=models.DateTimeField(auto_now_add=True)
	def __unicode__(self):
		return self.dev_title;