from django.shortcuts import render
from product.models import Product
from django.core.paginator import Paginator
from django.core import serializers
from django.http import HttpResponse

# Create your views here.
def index(request):
	products=Product.objects.all().order_by('-id')
	paginator=Paginator(products,30)
	page=1
	pre_page=page
	next_page=page+1
	return render(request,"index.html",{'products':paginator.page(1),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})

def pre_next(request,page):
	products=Product.objects.all().order_by('-id')
	paginator=Paginator(products,30)
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
	return render(request,"index.html",{'products':paginator.page(page),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})

def api_posts(request,counts):
	counts=int(counts)
	products=Product.objects.all().order_by('-id')[:counts]
	return HttpResponse(serializers.serialize('json',products))

def api_more_new(request,counts,max_id):
	counts=int(counts)
	max_id=int(max_id)
	products=Product.objects.filter(id__gt=max_id).order_by('-id')[:counts]
	return HttpResponse(serializers.serialize('json',products))

def api_more_old(request,counts,min_id):
	counts=int(counts)
	max_id=int(min_id)
	products=Product.objects.filter(id__lt=min_id).order_by('-id')[:counts]
	return HttpResponse(serializers.serialize('json',products))