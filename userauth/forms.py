from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.models import User
from django import forms

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