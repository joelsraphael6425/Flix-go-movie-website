# admin.py
from django.contrib import admin
from .models import Category, Trailer,User

admin.site.register(Category)
admin.site.register(Trailer)
admin.site.register(User)
