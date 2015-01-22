# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('book', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='book',
            name='booktimestamp',
            field=models.DateTimeField(default=datetime.datetime(2015, 1, 22, 20, 1, 20, 242000, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
    ]
