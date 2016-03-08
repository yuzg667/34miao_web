from django.shortcuts import render
from news.models import News
from django.core.paginator import Paginator
from django.core import serializers
from django.http import HttpResponse

# Create your views here.
def pre_next(request,page):
	newsAll=News.objects.all().order_by('-id')
	paginator=Paginator(newsAll,30)
	page=int(page)
	if page==1:
		pre_page=page
		next_page=page+1
	elif page==paginator.num_pages:
		pre_page=page-1;
		next_page=paginator.num_pages
	else:
		pre_page=page-1;
		next_page=page+1;
	return render(request,"news.html",{'newsAll':paginator.page(page),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})
def api_posts(request,counts):
        if request.method=='GET':
                counts=int(counts)
                newsAll=News.objects.all().order_by('-id')[:counts]
                return HttpResponse(serializers.serialize('json',newsAll))

def api_more_old(request,counts,min_id):
        counts=int(counts)
        min_id=int(min_id)
        newsAll=News.objects.filter(id__lt=min_id).order_by('-id')[:counts]
        return HttpResponse(serializers.serialize('json',newsAll))