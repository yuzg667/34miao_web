# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Marketing',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('m_title', models.CharField(max_length=200)),
                ('m_desc', models.CharField(max_length=1000, blank=True)),
                ('m_img_url', models.URLField(null=True, blank=True)),
                ('m_source', models.CharField(max_length=20)),
                ('m_link', models.URLField(null=True)),
                ('m_date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
