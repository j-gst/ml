# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('film', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='film',
            name='title',
            field=models.CharField(max_length=255, verbose_name='Titel'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='film',
            name='year',
            field=models.CharField(max_length=100, verbose_name='Jahr'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='participant',
            name='role',
            field=models.CharField(max_length=40, choices=[(b'director', b'Regisseur'), (b'writer', b'Autor'), (b'star', b'Schauspieler')]),
            preserve_default=True,
        ),
    ]
