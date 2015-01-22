# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('book', '0002_book_booktimestamp'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='paegs',
            field=models.CharField(default=0, max_length=100, verbose_name='Seitenzahl'),
            preserve_default=False,
        ),
    ]
