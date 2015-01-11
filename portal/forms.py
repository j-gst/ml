from django.forms import ModelForm
from django import forms
from portal.models import *
from django.forms.models import BaseInlineFormSet
from django.forms.models import inlineformset_factory


# Create the form class.
class AuthorForm(ModelForm):
    class Meta:
        model = Author

# Beate 02.01.2015
class BookForm(ModelForm):
    class Meta:
        model = Book


class BookCommentForm(ModelForm):
    class Meta:
        model = BookComment
        fields = ['text', ]

class BookRatingForm(ModelForm):


    class Meta:
        model = BookRating
        fields = ['rating', ]