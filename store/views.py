from django.shortcuts import render
from .models import *
from .forms import UserForm, UserProfileForm
from django.contrib.auth import authenticate, login as auth_login, logout
from django.http import HttpResponseRedirect, HttpResponse
from django.conf.urls import include, url


# Create your views here.


def index(request):
    pass


def getBook(request, book_id):
    book = Book.objects.get(id=book_id)
    return render(request, 'book.html', {'book': book})


def getBooks(request):
    books = Book.objects.all()
    print(len(books))
    return render(request, 'books.html', {'books': books})


def getAuthor(request, author_id):
    author = Author.objects.get(id=author_id)
    return render(request, 'author.html', {'author': author})


def getAuthors(request):
    authors = Author.objects.all()
    return render(request, 'authors.html', {'authors': authors})


def register(request):
    registered = False
    if request.method == 'POST':
        user_form = UserForm(data=request.POST)
        profile_form = UserProfileForm(data=request.POST)
        if user_form.is_valid() and profile_form.is_valid():
            user = user_form.save()
            user.set_password(user.password)
            user.save()
            profile = profile_form.save(commit=False)
            profile.user = user
            if 'avatar' in request.FILES:
                profile.avatar = request.FILES['avatar']

            profile.save()
            registered = True
            return HttpResponseRedirect('/store/')
        else:
            print(user_form.errors, profile_form.errors)
            return HttpResponse(user_form.errors, profile_form.errors)
        #     user_form = UserForm()
        #     profile_form = UserProfileForm()
        #
        # return render(request, "register.html",
        #               {'user_form': user_form, 'profile_form': profile_form, 'registered': registered
        #                   , 'user_errors': user_form.errors, 'avatar_error': profile_form.errors})
    else:
        user_form = UserForm()
        profile_form = UserProfileForm()

    return render(request, "register.html",
                  {'user_form': user_form, 'profile_form': profile_form, 'registered': registered})


def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        print(username,password)
        user = authenticate(username=username, password=password)
        print("user:",user.id)
        if user:
            if user.is_active:
                auth_login(request, user)
                request.session['user_id'] = user.id
                return HttpResponseRedirect('/store/book/')
            else:
                return HttpResponse('Your account is disabled')
        else:
            print("Invalid login details")
            return render(request, 'login.html', {"error_msg": "Invlaid login details"})
    else:
        return render(request, 'login.html')
