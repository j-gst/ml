from django.forms import ModelForm
from django import forms
from portal.models import *
from django.forms.models import BaseInlineFormSet
from django.forms.models import inlineformset_factory
from django.utils.translation import ugettext_lazy as _


# Create the form class.
class AuthorForm(ModelForm):
    class Meta:
        model = Author

# Beate 02.01.2015
class BookForm(ModelForm):
    class Meta:
        model = Book
        fields = ['title', 'isbn', 'description', 'cover', 'authors']

class BookCommentForm(ModelForm):
    class Meta:
        model = BookComment
        fields = ['text', ]
        labels = {'text': _('Geben Sie Ihren Kommentar ein:'),}
        widgets = {
          'text': forms.Textarea(attrs={'rows':4, 'cols':15}),
        }

class BookRatingForm(ModelForm):
    class Meta:
        model = BookRating
        fields = ['rating', ]


class BookOwningForm(ModelForm):
    class Meta:
        model = BookOwning
        fields = ['own', 'read',]
        labels = {
            'own': _('Gehoert mir'),
            'read': _('Habe ich gelesen'),
        }