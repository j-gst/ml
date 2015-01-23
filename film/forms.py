from django.forms import ModelForm
from django import forms
from film.models import *
from django.forms.models import BaseInlineFormSet
from django.forms.models import inlineformset_factory
from django.utils.translation import ugettext_lazy as _



class ParticipantForm(ModelForm):
    class Meta:
        model = Participant


class FilmForm(ModelForm):
    year = forms.ChoiceField(choices=((str(x), x) for x in range(1940,2016)))
    length = forms.ChoiceField(choices=((str(x), x) for x in range(0,300)))
    class Meta:
        model = Film
        
        fields = ['title', 'year','length', 'description', 'cover', 'participants', 'categories']

class CategoryForm(ModelForm):
    class Meta:
        model = Category

class FilmCommentForm(ModelForm):
    class Meta:
        model = FilmComment
        fields = ['text', ]
        labels = {'text': _('Geben Sie Ihren Kommentar ein:'),}
        widgets = {
          'text': forms.Textarea(attrs={'rows':4, 'cols':15}),
        }

class FilmRatingForm(ModelForm):
    class Meta:
        model = FilmRating
        fields = ['rating', ]


class FilmOwningForm(ModelForm):
    class Meta:
        model = FilmOwning
        fields = ['own', 'seen',]
        labels = {
            'own': _('Gehoert mir'),
            'seen': _('Habe ich gesehen'),
        }