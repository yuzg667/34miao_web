# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('design', '0002_auto_20150908_0350'),
    ]

    operations = [
        migrations.AlterField(
            model_name='design',
            name='design_desc',
            field=models.CharField(max_length=500, blank=True),
        ),
    ]
