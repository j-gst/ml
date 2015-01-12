# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0008_auto_20150112_2119'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bookowning',
            name='own',
            field=models.CharField(default=b'Nein', max_length=15, choices=[(b'Ja', b'Ja'), (b'Nein', b'Nein')]),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='bookowning',
            name='read',
            field=models.CharField(default=b'Nein', max_length=15, choices=[(b'Ja', b'Ja'), (b'Nein', b'Nein')]),
            preserve_default=True,
        ),
    ]
