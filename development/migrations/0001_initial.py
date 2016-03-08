# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Development',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('dev_title', models.CharField(max_length=200)),
                ('dev_source', models.CharField(max_length=20)),
                ('dev_link', models.URLField(null=True)),
                ('dev_category', models.CharField(max_length=20)),
                ('dev_date', models.DateTimeField(auto_now_add=True)),
            ],
        ),
    ]
