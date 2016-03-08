# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('design', '0003_auto_20150908_0417'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='design',
            name='design_desc',
        ),
    ]
