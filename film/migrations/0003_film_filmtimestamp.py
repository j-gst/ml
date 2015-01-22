# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('film', '0002_auto_20150122_1646'),
    ]

    operations = [
        migrations.AddField(
            model_name='film',
            name='filmtimestamp',
            field=models.DateTimeField(default=datetime.datetime(2015, 1, 22, 20, 24, 42, 619000, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
    ]
