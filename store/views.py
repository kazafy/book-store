from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .models import *
from .forms import UserForm, UserProfileForm
from django.contrib.auth import authenticate, login as auth_login, logout
from django.http import HttpResponseRedirect, HttpResponse
from django.http import JsonResponse
from django.db.models import  Avg ,Count
from django.conf.urls import include, url


STATUS = ['Read', 'Currently Reading', 'Want to Read']

books_num=len(Book.objects.all())
authors_num=len(Author.objects.all())



def index(request):
    books = Book.objects.all()#.order_by('-rateuserbook__rate')[:10]

    user = User.objects.get(id=request.session['user_id']);
    authors = Author.objects.all().\
            annotate(consumption_times=Count('followers'))\
            .order_by('consumption_times')[:10]


    for i in range(len(books)):
        books[i].s= books[i].bookstate_set.filter(user=user).first()
        books[i].r= books[i].rateuserbook_set.filter(user=user).first()
        books[i].avg =books[i].rateuserbook_set.all().aggregate(Avg('rate'))
        books[i].count =len(books[i].rateuserbook_set.all())

    return render(request, 'home.html', {'books': books,'authors': authors,'books_num':books_num,'authors_num':authors_num})


def goArea(request):
    books = Book.objects.all()
    authors = Author.objects.all()[:10]
    user = User.objects.get(id=request.session['user_id']);

    for i in range(len(books)):
        books[i].s= books[i].bookstate_set.filter(user=user).first()
        books[i].r= books[i].rateuserbook_set.filter(user=user).first()
        books[i].avg =books[i].rateuserbook_set.all().aggregate(Avg('rate'))
        books[i].count =len(books[i].rateuserbook_set.all())


    return render(request, 'myArea.html',{'books': books,'authors': authors,'books_num':books_num,'authors_num':authors_num})


@login_required
def exit(request):

    logout(request)

    # Take the user back to the homepage.
    return HttpResponseRedirect('/store/')

def getBook(request, book_id):
    book = Book.objects.get(id=book_id)
    # user = User.objects.get(id=request.session['user_id']);
    book.avg = book.rateuserbook_set.all().aggregate(Avg('rate'))
    book.count = len(book.rateuserbook_set.all())
    # print(book.bookstate_set.filter(user=user).first().statues)
    return render(request, 'book.html', {'book': book,'books_num':books_num,'authors_num':authors_num})


def getBookBy(request, key):
    books = Book.objects.filter(title__contains=key)

    return render(request, 'books.html', {'books': books,'books_num':books_num,'authors_num':authors_num})


def getBooks(request):
    books = Book.objects.all()

    user = User.objects.get(id=request.session['user_id']);
    authors = Author.objects.all().\
            annotate(consumption_times=Count('followers'))\
            .order_by('consumption_times')


    for i in range(len(books)):
        books[i].s= books[i].bookstate_set.filter(user=user).first()
        books[i].r= books[i].rateuserbook_set.filter(user=user).first()
        books[i].avg =books[i].rateuserbook_set.all().aggregate(Avg('rate'))
        books[i].count =len(books[i].rateuserbook_set.all())


        # if books[i].s:
        #     print (books[i].s.statues)


        # b.a = lambda: None
        # if b.s:
        #     setattr(b.a, 'state' , b.s.statues)
        #     print(b.a.state)
        # else:
        #     setattr(b.a, 'state', "2")
    return render(request, 'books.html', {'books': books, "user": user,'books_num':books_num,'authors_num':authors_num})



def getAuthor(request, author_id):
    author = Author.objects.get(id=author_id)
    hisBooks=Book.objects.filter(author=author)
    hisFollowers=len(author.followers.all())
    print(hisFollowers)
    return render(request, 'author.html', {'author': author,'hisBooks': hisBooks,'hisFollowers':hisFollowers,'books_num':books_num,'authors_num':authors_num})


def getAuthors(request):
    authors = Author.objects.all()
    user = User.objects.get(id=request.session['user_id']);
    return render(request, 'authors.html', {'authors': authors, "user": user,'books_num':books_num,'authors_num':authors_num})


def followAuthor(request, author_id):
    user = User.objects.get(id=request.session['user_id']);
    author = Author.objects.get(id=author_id)
    author.followers.remove(user)
    author.save()
    author.followers.add(user)
    author.save()

    return JsonResponse({'follow':"unfollow"})



def unFollowAuthor(request, author_id):
    user = User.objects.get(id=request.session['user_id']);
    author = Author.objects.get(id=author_id)
    author.followers.remove(user)
    author.save()

    return JsonResponse({'follow':"follow"})



def wantToRead(request, book_id, state):
    book = Book.objects.get(id=book_id)
    user = User.objects.get(id=request.session['user_id']);

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


    return JsonResponse({'statue': STATUS[int(state)]})

def bookNotify(request, num):
    books=Book.objects.all()
    list=len(books)
    print(list)
    if list>int(num):
        return JsonResponse({'books': list})
        print(list)
    else:
        return JsonResponse({'books': num})

def authorNotify(request, num):
    authors=Author.objects.all()
    list=len(authors)
    print(list)
    if list>int(num):
        return JsonResponse({'authors': list})
        print(list)
    else:
        return JsonResponse({'authors': num})




def rate(request , book_id ,rate):
    book = Book.objects.get(id=book_id)
    user = User.objects.get(id=request.session['user_id']);
    rateBook = RateUserBook.objects.filter(user=user,book=book)

    if rateBook:
        b = rateBook.first()
        b.rate = rate
        b.save()
    else:
        rateBook = RateUserBook()
        rateBook.book = book
        rateBook.user = user
        rateBook.statues = rate
        rateBook.save()

    return JsonResponse({'rate': rate})




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
        print(username, password)
        user = authenticate(username=username, password=password)
        print("user:", user.id)
        if user:
            if user.is_active:
                auth_login(request, user)
                request.session['user_id'] = user.id
                return HttpResponseRedirect('/store/')
            else:
                return HttpResponse('Your account is disabled')
        else:
            print("Invalid login details")
            return render(request, 'login.html', {"error_msg": "Invlaid login details"})
    else:
        return render(request, 'login.html')
