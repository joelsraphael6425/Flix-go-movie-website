from django.db import models

\
class User(models.Model):
    username = models.CharField(max_length=150, unique=True)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=150)

    def __str__(self):
        return self.username



from django.db import models
from django.utils import timezone



from django.db import models
from django.utils import timezone

class Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

from django.db import models
from django.utils import timezone

class Trailer(models.Model):
    title = models.CharField(max_length=255)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    cover_image = models.ImageField(upload_to='covers/')
    rating = models.FloatField()
    description = models.TextField()
    poster_image = models.ImageField(upload_to='posters/', default='posters/default_poster.jpg')
    full_details = models.TextField()
    cast = models.CharField(max_length=255, default='Unknown')
    release_date = models.DateField(default=timezone.now)
    youtube_trailer_link = models.URLField(default='https://www.youtube.com/watch?v=dQw4w9WgXcQ')
    username = models.CharField(max_length=255)  # Add a username field

    def __str__(self):
        return self.title


class Comment(models.Model):
    trailer = models.ForeignKey(Trailer, related_name='comments', on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
