"""sansimiao URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
from django.views.generic.base import RedirectView

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^favicon\.ico$',RedirectView.as_view(url='/static/common/img/favicon.ico')),
    url(r'^$',"product.views.index",name="product_home_url"),
    url(r'^products/(?P<page>\d+)/$',"product.views.pre_next",name="product_pre_next_page_url"),
    url(r'^api/product/posts/(?P<counts>\d+)/$',"product.views.api_posts"),
    url(r'^api/product/new/(?P<counts>\d+)/(?P<max_id>\d+)/$',"product.views.api_more_new"),
    url(r'^api/product/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"product.views.api_more_old"),
    url(r'^api/news/posts/(?P<counts>\d+)/$',"news.views.api_posts"),
    url(r'^api/news/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"news.views.api_more_old"),
    url(r'^api/design/posts/(?P<counts>\d+)/$',"design.views.api_posts"),
    url(r'^api/design/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"design.views.api_more_old"),
    url(r'^api/marketing/posts/(?P<counts>\d+)/$',"marketing.views.api_posts"),
    url(r'^api/marketing/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"marketing.views.api_more_old"),
    url(r'^api/development/posts/(?P<counts>\d+)/$',"development.views.api_posts"),
    url(r'^api/development/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"development.views.api_more_old"),
    url(r'^api/development/top/posts/(?P<counts>\d+)/$',"development.views.api_top_posts"),
    url(r'^api/development/top/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"development.views.api_more_top_old"),
    url(r'^api/development/front/posts/(?P<counts>\d+)/$',"development.views.api_front_posts"),
    url(r'^api/development/front/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"development.views.api_more_front_old"),
    url(r'^api/development/python/posts/(?P<counts>\d+)/$',"development.views.api_python_posts"),
    url(r'^api/development/python/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"development.views.api_more_python_old"),
    url(r'^api/development/iOS/posts/(?P<counts>\d+)/$',"development.views.api_iOS_posts"),
    url(r'^api/development/iOS/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"development.views.api_more_iOS_old"),
    url(r'^api/development/mySQL/posts/(?P<counts>\d+)/$',"development.views.api_mySQL_posts"),
    url(r'^api/development/mySQL/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"development.views.api_more_mySQL_old"),
    url(r'^api/development/operation/posts/(?P<counts>\d+)/$',"development.views.api_operation_posts"),
    url(r'^api/development/operation/old/(?P<counts>\d+)/(?P<min_id>\d+)/$',"development.views.api_more_operation_old"),
    url(r'^news/(?P<page>\d+)/$',"news.views.pre_next",name="news_pre_next_page_url"),
    url(r'^design/(?P<page>\d+)/$',"design.views.pre_next",name="design_pre_next_page_url"),
    url(r'^marketing/(?P<page>\d+)/$',"marketing.views.pre_next",name="marketing_pre_next_page_url"),
    url(r'^development/(?P<page>\d+)/$',"development.views.pre_next",name="development_pre_next_page_url"),
    url(r'^development/top/(?P<page>\d+)/$',"development.views.top_pre_next",name="development_top_pre_next_page_url"),
    url(r'^development/front/(?P<page>\d+)/$',"development.views.front_pre_next",name="development_front_pre_next_page_url"),
    url(r'^development/python/(?P<page>\d+)/$',"development.views.python_pre_next",name="development_python_pre_next_page_url"),
    url(r'^development/iOS/(?P<page>\d+)/$',"development.views.iOS_pre_next",name="development_iOS_pre_next_page_url"),
    url(r'^development/mySQL/(?P<page>\d+)/$',"development.views.mySQL_pre_next",name="development_mySQL_pre_next_page_url"),
    url(r'^development/operation/(?P<page>\d+)/$',"development.views.operation_pre_next",name="development_operation_pre_next_page_url"),
]
