# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('portal', '0007_auto_20150111_1546'),
    ]

    operations = [
        migrations.CreateModel(
            name='BookOwning',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('own', models.CharField(default=2, max_length=5, choices=[(1, b'Ja'), (2, b'Nein')])),
                ('read', models.CharField(default=2, max_length=5, choices=[(1, b'Ja'), (2, b'Nein')])),
                ('owningdate', models.DateTimeField(auto_now=True)),
                ('book', models.ForeignKey(to='portal.Book')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AlterUniqueTogether(
            name='bookowning',
            unique_together=set([('user', 'book')]),
        ),
        migrations.AlterField(
            model_name='bookrating',
            name='rating',
            field=models.IntegerField(default=1, max_length=1, choices=[(1, b'1'), (2, b'2'), (3, b'3'), (4, b'4'), (5, b'5')]),
            preserve_default=True,
        ),
    ]
