# views.py
from django.shortcuts import render, redirect
from .forms import UserForm
from django.contrib.auth import logout
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.db import connection
from .models import User
from django.shortcuts import render, get_object_or_404

def index(request):
    return render(request, 'index.html')


def signup(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            email = form.cleaned_data['email']

            # Check if a user with the provided username or email already exists
            if User.objects.filter(username=username).exists() or User.objects.filter(email=email).exists():
                # User with the provided username or email already exists
                return JsonResponse({'exists': True})

            # Create the user if it doesn't exist
            user = form.save()
            request.session['user_id'] = user.id
            return JsonResponse({'exists': False})  # Indicate that the user doesn't exist and signup was successful

    else:
        form = UserForm()
    return render(request, 'signup.html', {'form': form})

from django.shortcuts import render
from .decorators import login_required



@login_required
def home_view(request):
    trailers = Trailer.objects.all()  # Assuming Trailer is your model
    user_id = request.session.get('user_id')
    username = None

    if user_id:  # Check if user_id exists
        try:
            user = User.objects.get(id=user_id)  # Query the User model to get the user object
            username = user.username  # Retrieve the username from the user object
        except User.DoesNotExist:
            pass  # Handle the case where user does not exist

    return render(request, 'home.html', {'trailers': trailers, 'username': username})




def user_logout(request):
    logout(request)
    return redirect('index1')

def home_or_signin(request):
    if request.session.get('user_id'):
        return redirect('home_view')
    else:
        return redirect('signin')


from django.shortcuts import render, redirect
from django.contrib import messages
from django.db import connection
from .models import User


def signin(request):
    if request.method == 'POST':
        username_or_email = request.POST['username_or_email']
        password = request.POST['password']

        # Custom user authentication by username or email
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM movieapp_user WHERE username = %s OR email = %s", [username_or_email, username_or_email])
            user_data = cursor.fetchone()

        if user_data:
            # User found, check password
            if user_data[5] == password:  # Assuming password is at index 5 in the tuple
                # Create a User object from the fetched data
                user = User(id=user_data[0], username=user_data[1], first_name=user_data[2],
                            last_name=user_data[3], email=user_data[4], password=user_data[5])
                request.session['user_id'] = user.id
                messages.success(request, "Welcome! You have successfully signed in.")
                return redirect('home_view')  # Ensure 'home_view' is the correct URL name
            else:
                messages.error(request, "Invalid username/email or password.")
                request.session['invalid_login'] = True
                return redirect('signin')
        else:
            messages.error(request, "Invalid username/email or password.")
            request.session['invalid_login'] = True
            return redirect('signin')

    return render(request, 'signin.html')

    
def signout(request):
    logout(request)
    if 'user_id' in request.session:
        del request.session['user_id']  # Clear the user ID from session
    return redirect('index')



@login_required
def add_trailer(request):
    user_id = request.session.get('user_id')
    user = User.objects.get(pk=user_id)  # Fetch user object using user_id
    username = user.username  # Get username from the user object

    if request.method == 'POST':
        form = TrailerForm(request.POST, request.FILES)
        if form.is_valid():
            # Save the form data along with the username
            trailer = form.save(commit=False)
            trailer.username = username  # Assign the username
            trailer.save()
            messages.success(request, 'Trailer added successfully.')  # Add success message
            return redirect('home')  # Redirect to 'home'
    else:
        form = TrailerForm()
    return render(request, 'add_trailer.html', {'form': form, 'user_id': user_id, 'username': username})



from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.db import connection
from .models import Trailer, Comment
from .forms import CommentForm

@login_required
def trailer_detail(request, id):
    trailer = get_object_or_404(Trailer, id=id)
    comments = trailer.comments.all()
    comment_form = CommentForm()

    user_id = request.session.get('user_id')
    if request.method == 'POST':
        if user_id:
            comment_form = CommentForm(request.POST)
            if comment_form.is_valid():
                with connection.cursor() as cursor:
                    cursor.execute("SELECT id, username FROM movieapp_user WHERE id = %s", [user_id])
                    user_data = cursor.fetchone()

                if user_data:
                    comment = comment_form.save(commit=False)
                    comment.trailer = trailer
                    comment.user_id = user_data[0]
                    comment.save()
                    messages.success(request, "Comment posted successfully.")
                    return redirect('trailer_detail', id=trailer.id)
                else:
                    messages.error(request, "User not found.")
                    return redirect('signin')
        else:
            messages.error(request, "You need to sign in to post a comment.")
            return redirect('signin')

    return render(request, 'trailer_detail.html', {'trailer': trailer, 'comments': comments, 'comment_form': comment_form, 'user_id': user_id})




from django.shortcuts import render, redirect
from django.db import connection
from django.contrib import messages
@login_required
def profile_view(request):
    user_id = request.session.get('user_id')
    if not user_id:
        messages.error(request, "You need to sign in to view the profile page.")
        return redirect('signin')

    with connection.cursor() as cursor:
        cursor.execute("SELECT id, username, first_name, last_name, email, password FROM movieapp_user WHERE id = %s", [user_id])
        user_data = cursor.fetchone()

    if user_data:
        user = {
            'id': user_data[0],
            'username': user_data[1],
            'first_name': user_data[2],
            'last_name': user_data[3],
            'email': user_data[4],
            'password': user_data[5]
        }
        return render(request, 'profile.html', {'user': user})
    else:
        messages.error(request, "User not found.")
        return redirect('signin')

from django.shortcuts import render, redirect
from django.contrib import messages
from django.db import connection
@login_required
def edit_profile_view(request):
    user_id = request.session.get('user_id')
    if not user_id:
        messages.error(request, "You need to sign in to edit your profile.")
        return redirect('signin')

    if request.method == 'POST':
        username = request.POST['username']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        email = request.POST['email']
        password = request.POST['password']

        with connection.cursor() as cursor:
            cursor.execute("""
                UPDATE movieapp_user
                SET username = %s, first_name = %s, last_name = %s, email = %s, password = %s
                WHERE id = %s
            """, [username, first_name, last_name, email, password, user_id])
        
        messages.success(request, "Your profile has been updated.")
        return redirect('home_view')

    else:
        with connection.cursor() as cursor:
            cursor.execute("SELECT id, username, first_name, last_name, email, password FROM movieapp_user WHERE id = %s", [user_id])
            user_data = cursor.fetchone()

        if user_data:
            user = {
                'id': user_data[0],
                'username': user_data[1],
                'first_name': user_data[2],
                'last_name': user_data[3],
                'email': user_data[4],
                'password': user_data[5]
            }
            return render(request, 'edit_profile.html', {'user': user})
        else:
            messages.error(request, "User not found.")
            return redirect('signin')


# views.py
from django.shortcuts import render
from .models import Category, Trailer
from .forms import TrailerSearchForm

@login_required
def category_view(request):
    categories = Category.objects.all()
    return render(request, 'category.html', {'categories': categories})
@login_required
def category_items_view(request, category_id):
    category = Category.objects.get(pk=category_id)
    trailers = Trailer.objects.filter(category_id=category_id)
    return render(request, 'category_items.html', {'category': category, 'trailers': trailers})
@login_required
def search_trailer_view(request):
    query = request.GET.get('query', '')
    trailers = Trailer.objects.filter(title__icontains=query) if query else []
    categories = Category.objects.all()  # Show categories for navigation
    return render(request, 'category.html', {
        'categories': categories,
        'trailers': trailers,
        'search_query': query
    })


from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages  # Import Django's messaging framework
from .models import Trailer
from .forms import TrailerForm

def edit_trailer(request, trailer_id):
    trailer = get_object_or_404(Trailer, id=trailer_id)
    if request.method == 'POST':
        form = TrailerForm(request.POST, request.FILES, instance=trailer)
        if form.is_valid():
            form.save()
            messages.success(request, 'Trailer successfully edited.')  # Add success message
            return redirect('home_view')
    else:
        form = TrailerForm(instance=trailer)
    return render(request, 'edit_trailer.html', {'form': form, 'trailer': trailer})



from django.shortcuts import redirect, get_object_or_404
from .models import Trailer

def delete_trailer(request, trailer_id):
    trailer = get_object_or_404(Trailer, id=trailer_id)
    if request.method == 'POST':
        trailer.delete()
        return redirect('home_view')  # Redirect to the home view after deletion
    return redirect('home_view')  # Redirect to the home view if request method is not POST
