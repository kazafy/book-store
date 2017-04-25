from django.shortcuts import render
from .models import *
# Create your views here.


def index(request):
    pass


def getBook(request,book_id):
    book= Book.objects.get(id=book_id)
    return render(request,'book.html', {'book': book})


def getBooks(request):
    books = Book.objects.all()
    print(len(books))
    return render(request,'books.html', {'books': books})


def getAuthor(request,author_id):
    author= Author.objects.get(id=author_id)
    return render(request,'author.html', {'author': author})


def getAuthors(request):
    authors = Author.objects.all()
    return render(request,'authors.html', {'authors': authors})

