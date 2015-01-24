"""
models userauth app
Objektorientierte Scriptsprachen WS 2014
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
from django.contrib.auth.models import User
from django.forms.models import ModelChoiceField


""" Messages
"""
@python_2_unicode_compatible
class Msg(models.Model):
    subject = models.CharField('Betreff',  blank=False , max_length = 40)
    text = models.TextField('Kommentartext',  blank=False)
    to_user = models.ForeignKey(User, unique=False , related_name='userto')
    from_user = models.ForeignKey(User, unique=False, related_name='userfrom')
    msgdate = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return '%s' % (self.subject)

