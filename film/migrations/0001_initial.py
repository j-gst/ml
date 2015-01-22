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
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('categoryname', models.CharField(max_length=255, verbose_name=b'category')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Film',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=255)),
                ('year', models.CharField(max_length=100)),
                ('description', models.TextField(verbose_name='Beschreibung', blank=True)),
                ('cover', models.FileField(default=b'cover/default/default.png', upload_to=b'cover/film/%Y%m%d')),
                ('categories', models.ManyToManyField(to='film.Category', verbose_name='Kategorien')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='FilmComment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('text', models.TextField(verbose_name=b'Kommentartext')),
                ('commentdate', models.DateTimeField(auto_now=True)),
                ('film', models.ForeignKey(to='film.Film')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='FilmOwning',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('own', models.CharField(default=b'Nein', max_length=15, choices=[(b'Ja', b'Ja'), (b'Nein', b'Nein')])),
                ('seen', models.CharField(default=b'Nein', max_length=15, choices=[(b'Ja', b'Ja'), (b'Nein', b'Nein')])),
                ('owningdate', models.DateTimeField(auto_now=True)),
                ('film', models.ForeignKey(to='film.Film')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='FilmRating',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('rating', models.IntegerField(default=1, max_length=1, choices=[(1, b'1'), (2, b'2'), (3, b'3'), (4, b'4'), (5, b'5')])),
                ('ratingdate', models.DateTimeField(auto_now=True)),
                ('film', models.ForeignKey(to='film.Film')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Participant',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('firstname', models.CharField(max_length=255, verbose_name=b'lastname')),
                ('lastname', models.CharField(max_length=255, verbose_name=b'firstname')),
                ('role', models.CharField(max_length=40, choices=[(b'director', b'Direktor'), (b'writer', b'Author'), (b'star', b'Schauspieler')])),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AlterUniqueTogether(
            name='filmrating',
            unique_together=set([('user', 'film')]),
        ),
        migrations.AlterUniqueTogether(
            name='filmowning',
            unique_together=set([('user', 'film')]),
        ),
        migrations.AddField(
            model_name='film',
            name='participants',
            field=models.ManyToManyField(to='film.Participant', verbose_name='Mitwirkende'),
            preserve_default=True,
        ),
    ]
