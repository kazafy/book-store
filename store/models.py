from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator , MinValueValidator
# Create your models here.


class Author (models.Model):
    image = models.ImageField()
    name = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    dob = models.DateField()
    user = models.ManyToManyField(User)


class Category(models.Model):
    name = models.CharField(max_length=50)


class Book (models.Model):
    title = models.CharField(max_length=200)
    publish_date = models.DateField()
    summary = models.TextField()
    category = models.ForeignKey(Category)
    author = models.ForeignKey(Author)
    rate = models.ManyToManyField(User,related_name='rates', through="RateUserBook")
    readStatus = models.ManyToManyField(User,related_name='status' , through="BookState")


class RateUserBook(models.Model):
    user = models.ForeignKey(User)
    book = models.ForeignKey(Book)
    rate = models.IntegerField(
        default=1,
        validators=[MaxValueValidator(5),MinValueValidator(1)]
    )

class BookState(models.Model):

    STATUS = (('0','read'),('1','Currently reading'),('2','Want to read'))
    user = models.ForeignKey(User)
    book = models.ForeignKey(Book)
    statues = models.CharField(max_length=1, choices=STATUS)