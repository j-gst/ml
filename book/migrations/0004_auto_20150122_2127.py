# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('book', '0003_book_paegs'),
    ]

    operations = [
        migrations.RenameField(
            model_name='book',
            old_name='paegs',
            new_name='pages',
        ),
    ]
