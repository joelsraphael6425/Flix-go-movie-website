from django.urls import path
from .views import index,signup
from movieapp import views
from django.conf.urls.static import static
from django.conf import settings
from .views import user_logout
from .views import signin, signout
from django.urls import path, reverse_lazy
from django.views.generic.base import RedirectView
from .views import (
    signin, signup, home_view, user_logout, signout, add_trailer, 
    index, home_or_signin, trailer_detail, profile_view, 
    edit_profile_view, category_view, category_items_view, search_trailer_view
)

urlpatterns = [
    path('', RedirectView.as_view(url=reverse_lazy('home_or_signin')), name='root'),
    path('index/', index, name='index'),
    path('signup/', signup, name='signup'),
    path('signup/home_view/', home_view, name='home_view'),
    path('logout/', user_logout, name='logout'),
    path('signin/', signin, name='signin'),
    path('signout/', signout, name='signout'),
    path('home_view/', home_view, name='home_view'),
    path('add_trailer/', add_trailer, name='add_trailer'),
    path('home/', home_view, name='home'),
    path('trailer/<int:id>/', trailer_detail, name='trailer_detail'),
    path('profile/', profile_view, name='profile_view'),
    path('edit_profile/', edit_profile_view, name='edit_profile_view'),
    path('category/', category_view, name='category'),
    path('category/<int:category_id>/', category_items_view, name='category_items'),
    path('search/', search_trailer_view, name='search_trailer'),
    path('home_or_signin/', home_or_signin, name='home_or_signin'),  # Add this line
     path('edit_trailer/<int:trailer_id>/', views.edit_trailer, name='edit_trailer'),
      path('delete_trailer/<int:trailer_id>/', views.delete_trailer, name='delete_trailer'),
 path('trailer/<int:trailer_id>/', views.trailer_detail, name='trailer_detail'),

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
