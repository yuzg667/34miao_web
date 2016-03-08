from django.shortcuts import render
from development.models import Development
from django.core.paginator import Paginator
from django.core import serializers
from django.http import HttpResponse

# Create your views here.
def pre_next(request,page):
	developmentAll=Development.objects.all().order_by('-id')
	paginator=Paginator(developmentAll,30)
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
	return render(request,"development.html",{'developmentAll':paginator.page(page),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})
def top_pre_next(request,page):
	devtopAll=Development.objects.filter(dev_category='top').order_by('-id')
	paginator=Paginator(devtopAll,30)
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
	return render(request,"dev_top.html",{'devtopAll':paginator.page(page),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})
def front_pre_next(request,page):
	devfrontAll=Development.objects.filter(dev_category='front').order_by('-id')
	paginator=Paginator(devfrontAll,30)
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
	return render(request,"dev_front.html",{'devfrontAll':paginator.page(page),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})
def python_pre_next(request,page):
	devpythonAll=Development.objects.filter(dev_category='python').order_by('-id')
	paginator=Paginator(devpythonAll,30)
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
	return render(request,"dev_python.html",{'devpythonAll':paginator.page(page),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})
def iOS_pre_next(request,page):
	deviOSAll=Development.objects.filter(dev_category='iOS').order_by('-id')
	paginator=Paginator(deviOSAll,30)
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
	return render(request,"dev_iOS.html",{'deviOSAll':paginator.page(page),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})
def mySQL_pre_next(request,page):
	devmySQLAll=Development.objects.filter(dev_category='mySQL').order_by('-id')
	paginator=Paginator(devmySQLAll,30)
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
	return render(request,"dev_mySQL.html",{'devmySQLAll':paginator.page(page),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})
def operation_pre_next(request,page):
	devoperationAll=Development.objects.filter(dev_category='operation').order_by('-id')
	paginator=Paginator(devoperationAll,30)
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
	return render(request,"dev_operation.html",{'devoperationAll':paginator.page(page),
										'pre_page':pre_page,
										'next_page':next_page,
										'page':page,
										'pages':paginator.num_pages,
										})

def api_posts(request,counts):
        if request.method=='GET':
                counts=int(counts)
                developmentAll=Development.objects.all().order_by('-id')[:counts]
                return HttpResponse(serializers.serialize('json',developmentAll))

def api_more_old(request,counts,min_id):
        counts=int(counts)
        min_id=int(min_id)
        developmentAll=Development.objects.filter(id__lt=min_id).order_by('-id')[:counts]
        return HttpResponse(serializers.serialize('json',developmentAll))

def api_top_posts(request,counts):
        if request.method=='GET':
                counts=int(counts)
                dev_topAll=Development.objects.filter(dev_category='top').order_by('-id')[:counts]
                return HttpResponse(serializers.serialize('json',dev_topAll))

def api_more_top_old(request,counts,min_id):
        counts=int(counts)
        min_id=int(min_id)
        dev_topAll=Development.objects.filter(dev_category='top',id__lt=min_id).order_by('-id')[:counts]
        return HttpResponse(serializers.serialize('json',dev_topAll))

def api_front_posts(request,counts):
        if request.method=='GET':
                counts=int(counts)
                dev_frontAll=Development.objects.filter(dev_category='front').order_by('-id')[:counts]
                return HttpResponse(serializers.serialize('json',dev_frontAll))

def api_more_front_old(request,counts,min_id):
        counts=int(counts)
        min_id=int(min_id)
        dev_frontAll=Development.objects.filter(dev_category='front',id__lt=min_id).order_by('-id')[:counts]
        return HttpResponse(serializers.serialize('json',dev_frontAll))

def api_python_posts(request,counts):
        if request.method=='GET':
                counts=int(counts)
                dev_pythonAll=Development.objects.filter(dev_category='python').order_by('-id')[:counts]
                return HttpResponse(serializers.serialize('json',dev_pythonAll))

def api_more_python_old(request,counts,min_id):
        counts=int(counts)
        min_id=int(min_id)
        dev_pythonAll=Development.objects.filter(dev_category='python',id__lt=min_id).order_by('-id')[:counts]
        return HttpResponse(serializers.serialize('json',dev_pythonAll))

def api_iOS_posts(request,counts):
        if request.method=='GET':
                counts=int(counts)
                dev_iOSAll=Development.objects.filter(dev_category='iOS').order_by('-id')[:counts]
                return HttpResponse(serializers.serialize('json',dev_iOSAll))

def api_more_iOS_old(request,counts,min_id):
        counts=int(counts)
        min_id=int(min_id)
        dev_iOSAll=Development.objects.filter(dev_category='iOS',id__lt=min_id).order_by('-id')[:counts]
        return HttpResponse(serializers.serialize('json',dev_iOSAll))

def api_mySQL_posts(request,counts):
        if request.method=='GET':
                counts=int(counts)
                dev_mySQLAll=Development.objects.filter(dev_category='mySQL').order_by('-id')[:counts]
                return HttpResponse(serializers.serialize('json',dev_mySQLAll))

def api_more_mySQL_old(request,counts,min_id):
        counts=int(counts)
        min_id=int(min_id)
        dev_mySQLAll=Development.objects.filter(dev_category='mySQL',id__lt=min_id).order_by('-id')[:counts]
        return HttpResponse(serializers.serialize('json',dev_mySQLAll))

def api_operation_posts(request,counts):
        if request.method=='GET':
                counts=int(counts)
                dev_operationAll=Development.objects.filter(dev_category='operation').order_by('-id')[:counts]
                return HttpResponse(serializers.serialize('json',dev_operationAll))

def api_more_operation_old(request,counts,min_id):
        counts=int(counts)
        min_id=int(min_id)
        dev_operationAll=Development.objects.filter(dev_category='operation',id__lt=min_id).order_by('-id')[:counts]
        return HttpResponse(serializers.serialize('json',dev_operationAll))

