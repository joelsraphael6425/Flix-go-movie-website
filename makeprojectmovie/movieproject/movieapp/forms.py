from django import forms
from .models import User
from django import forms
from .models import Trailer


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password']
        widgets = {
            'password': forms.PasswordInput(),
        }

    def clean_username(self):
        username = self.cleaned_data.get('username')
        if User.objects.filter(username=username).exists():
            raise forms.ValidationError("Username already exists")
        return username


from django import forms

class LoginForm(forms.Form):
    username = forms.CharField(max_length=150)
    password = forms.CharField(widget=forms.PasswordInput)
    
# movieapp/forms.py

from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import User

class SignUpForm(UserCreationForm):
    email = forms.EmailField(max_length=150, help_text='Required. Enter a valid email address.')

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2')




class TrailerForm(forms.ModelForm):
    class Meta:
        model = Trailer
        fields = [
            'title', 'category', 'cover_image', 'rating', 'description',
            'poster_image', 'full_details', 'cast', 'release_date', 'youtube_trailer_link'
        ]


from django import forms
from .models import Comment

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['text']

# forms.py
from django import forms

class TrailerSearchForm(forms.Form):
    query = forms.CharField(label='Search Trailers', max_length=255)
