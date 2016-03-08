from django.db import models

# Create your models here.
class Marketing(models.Model):
	m_title=models.CharField(max_length=200)
	m_desc=models.CharField(max_length=1000,blank=True)
	m_img_url=models.URLField(null=True,blank=True)
	m_source=models.CharField(max_length=20)
	m_link=models.URLField(null=True)
	m_date=models.DateTimeField(auto_now_add=True)
	def __unicode__(self):
		return self.m_title;