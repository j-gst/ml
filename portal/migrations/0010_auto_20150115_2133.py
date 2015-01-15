# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0009_auto_20150112_2208'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='cover',
            field=models.FileField(default=b'cover/default/default.png', upload_to=b'cover/%Y%m%d'),
            preserve_default=True,
        ),
    ]
