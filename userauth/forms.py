"""
forms userauth app
Objektorientierte Scriptsprachen WS 2014
Autoren: Beate Gericke, Gerrit Storm
24.01.2015
"""
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm
from django import forms
from django.forms import ModelForm
from models import Msg
from django.forms.models import ModelChoiceField
from django.contrib.auth.models import User

""" Formular Registrierung
"""
class RegisterForm(UserCreationForm):
    email = forms.EmailField(required=True)
    class Meta:
        model = User
        fields = ( "username", "email", "first_name", "last_name" )

""" Formular Profil bearbeiten
"""             
class ProfileForm(UserChangeForm):
    # password Feld loeschen
    def __init__(self, *args, **kwargs):
        super(ProfileForm, self).__init__(*args, **kwargs)
        del self.fields['password']       
    email = forms.EmailField(required=True)
    class Meta:
        model = User
        fields = ( "username", "email", "first_name", "last_name" )
        
""" Formular Nachricht schreiben
"""       
class MsgForm(ModelForm):
    class Meta:
        model = Msg
        fields = ['subject','to_user','text' ]
        labels = {'text': ('Ihre Nachricht'), 'subject': ('Ihr Betreff'),'to_user': ('Nachricht an:'),    }
        widgets = {
          'text': forms.Textarea(attrs={'rows':4, 'cols':15}),
        }