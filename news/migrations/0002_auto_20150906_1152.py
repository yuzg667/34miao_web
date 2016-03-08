# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('news', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='news',
            name='n_desc',
            field=models.CharField(max_length=1000, blank=True),
        ),
        migrations.AlterField(
            model_name='news',
            name='n_img_url',
            field=models.URLField(null=True, blank=True),
        ),
    ]
