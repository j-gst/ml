# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0005_auto_20150111_1358'),
    ]

    operations = [
        migrations.AddField(
            model_name='bookcomment',
            name='commentdate',
            field=models.DateTimeField(default=datetime.datetime(2015, 1, 11, 14, 33, 39, 877000, tzinfo=utc), auto_now=True),
            preserve_default=False,
        ),
    ]
