# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Design',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('design_title', models.CharField(max_length=200)),
                ('design_desc', models.CharField(max_length=500, blank=True)),
                ('design_img_url', models.URLField(null=True, blank=True)),
                ('design_source', models.CharField(max_length=20)),
                ('design_link', models.URLField(null=True)),
                ('design_date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
