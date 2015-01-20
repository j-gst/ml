from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm
from django import forms
from django.forms import ModelForm
from models import Msg
from django.forms.models import ModelChoiceField
from django.contrib.auth.models import User


class RegisterForm(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ( "username", "email", "first_name", "last_name" )
        
        
class ProfileForm(UserChangeForm):

    def __init__(self, *args, **kwargs):
        super(ProfileForm, self).__init__(*args, **kwargs)
        del self.fields['password']
        
    email = forms.EmailField(required=True)
    class Meta:
        model = User
        fields = ( "username", "email", "first_name", "last_name" )
        
        
   
class MsgForm(ModelForm):

    class Meta:
        model = Msg
        fields = ['subject','to_user','text' ]
        labels = {'text': ('Ihre Nachricht'), 'subject': ('Ihr Betreff'),'to_user': ('Nachricht an:'),    }
        widgets = {
          'text': forms.Textarea(attrs={'rows':4, 'cols':15}),
        }