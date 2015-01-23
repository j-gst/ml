# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('film', '0004_film_length'),
    ]

    operations = [
        migrations.AlterField(
            model_name='film',
            name='length',
            field=models.CharField(max_length=3, verbose_name='Spieldauer in Minuten'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='film',
            name='year',
            field=models.CharField(max_length=4, verbose_name='Jahr'),
            preserve_default=True,
        ),
    ]
