# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='author',
            name='firstname',
            field=models.CharField(max_length=255, verbose_name=b'lastname'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='author',
            name='lastname',
            field=models.CharField(max_length=255, verbose_name=b'firstname'),
            preserve_default=True,
        ),
    ]
