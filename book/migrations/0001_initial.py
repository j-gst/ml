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
            name='Author',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('firstname', models.CharField(max_length=255, verbose_name=b'lastname')),
                ('lastname', models.CharField(max_length=255, verbose_name=b'firstname')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=255)),
                ('isbn', models.CharField(max_length=100)),
                ('description', models.TextField(verbose_name='Beschreibung', blank=True)),
                ('cover', models.FileField(default=b'cover/default/default.png', upload_to=b'cover/%Y%m%d')),
                ('authors', models.ManyToManyField(to='book.Author', verbose_name='Autoren')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='BookComment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('text', models.TextField(verbose_name=b'Kommentartext')),
                ('commentdate', models.DateTimeField(auto_now=True)),
                ('book', models.ForeignKey(to='book.Book')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='BookOwning',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('own', models.CharField(default=b'Nein', max_length=15, choices=[(b'Ja', b'Ja'), (b'Nein', b'Nein')])),
                ('read', models.CharField(default=b'Nein', max_length=15, choices=[(b'Ja', b'Ja'), (b'Nein', b'Nein')])),
                ('owningdate', models.DateTimeField(auto_now=True)),
                ('book', models.ForeignKey(to='book.Book')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='BookRating',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('rating', models.IntegerField(default=1, max_length=1, choices=[(1, b'1'), (2, b'2'), (3, b'3'), (4, b'4'), (5, b'5')])),
                ('ratingdate', models.DateTimeField(auto_now=True)),
                ('book', models.ForeignKey(to='book.Book')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('categoryname', models.CharField(max_length=255, verbose_name=b'category')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AlterUniqueTogether(
            name='bookrating',
            unique_together=set([('user', 'book')]),
        ),
        migrations.AlterUniqueTogether(
            name='bookowning',
            unique_together=set([('user', 'book')]),
        ),
        migrations.AddField(
            model_name='book',
            name='categories',
            field=models.ManyToManyField(to='book.Category', verbose_name='Kategorien'),
            preserve_default=True,
        ),
    ]
