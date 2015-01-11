# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('portal', '0004_bookcomment'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bookcomment',
            name='book',
            field=models.ForeignKey(to='portal.Book'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='bookcomment',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
            preserve_default=True,
        ),
    ]
