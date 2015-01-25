# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('book', '0005_auto_20150123_2207'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='cover',
            field=models.FileField(default=b'cover/default/default.png', upload_to=b'cover/book/%Y%m%d'),
            preserve_default=True,
        ),
    ]
