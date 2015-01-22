# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('film', '0003_film_filmtimestamp'),
    ]

    operations = [
        migrations.AddField(
            model_name='film',
            name='length',
            field=models.CharField(default=0, max_length=100, verbose_name='Spieldauer'),
            preserve_default=False,
        ),
    ]
