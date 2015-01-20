# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Msg',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('subject', models.CharField(max_length=40, verbose_name=b'Betreff')),
                ('text', models.TextField(verbose_name=b'Kommentartext')),
                ('msgdate', models.DateTimeField(auto_now=True)),
                ('from_user', models.ForeignKey(related_name='userfrom', to=settings.AUTH_USER_MODEL)),
                ('to_user', models.ForeignKey(related_name='userto', to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
