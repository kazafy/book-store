from django.shortcuts import render
from .models import *
from .forms import UserForm, UserProfileForm
from django.contrib.auth import authenticate, login as auth_login, logout
from django.http import HttpResponseRedirect, HttpResponse
from django.conf.urls import include, url

class Expand(object):
    pass

# Create your views here.


def index(request):
    pass


def getBook(request, book_id):
    book = Book.objects.get(id=book_id)
    user = User.objects.get(id=2);

    print(book.bookstate_set.filter(user=user).first().statues)
    return render(request, 'book.html', {'book': book})


def getBookBy(request , key):
    books = Book.objects.filter(title__contains=key)


    return render(request, 'books.html', {'books': books})


def getBooks(request):
    # o = Expand()
    # o.first = 25
    # print (o.first)
    books = Book.objects.all()
    user = User.objects.get(id=2);

    for i in range(len(books)):
        books[i].s= books[i].bookstate_set.filter(user=user).first()
        # if books[i].s:
        #     print (books[i].s.statues)


        # b.a = lambda: None
        # if b.s:
        #     setattr(b.a, 'state' , b.s.statues)
        #     print(b.a.state)
        # else:
        #     setattr(b.a, 'state', "2")
    return render(request, 'books.html', {'books': books,"user":user})


def getAuthor(request, author_id):
    author = Author.objects.get(id=author_id)
    return render(request, 'author.html', {'author': author})


def getAuthors(request):
    authors = Author.objects.all()
    user = User.objects.get(id=2);


    return render(request, 'authors.html', {'authors': authors, "user": user})


def followAuthor(request, author_id):
    user = User.objects.get(id=2);
    author = Author.objects.get(id=author_id)
    author.followers.add(user)
    author.save()
    print(author.followers.all())
    return render(request, 'authors.html', {'authors': user.author_set.all(), "user": user})


def unFollowAuthor(request, author_id):
    user = User.objects.get(id=2);
    author = Author.objects.get(id=author_id)
    author.followers.remove(user)
    author.save()
    return render(request, 'authors.html', {'authors': user.author_set.all(), "user": user})


def wantToRead(request , book_id ,state):
    book = Book.objects.get(id=book_id)
    user = User.objects.get(id=2);
    bookStatus = BookState.objects.filter(user=user,book=book)
    if bookStatus:
        b = bookStatus.first()
        b.statues = state
        b.save()
    else:
        bookStatus = BookState()
        bookStatus.book = book
        bookStatus.user = user
        bookStatus.statues = state
        bookStatus.save()
    # print(len(bookStatus.all()))
    books = Book.objects.all()
    return render(request, 'books.html', {'books': books,"user":user})




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
