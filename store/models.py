from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MaxValueValidator, MinValueValidator


# Create your models here.

class Author(models.Model):
    image = models.ImageField(upload_to='imgs', blank=True, null=True)
    name = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    dob = models.DateField()
    followers = models.ManyToManyField(User)

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Book(models.Model):
    title = models.CharField(max_length=200)
    publish_date = models.DateField()
    summary = models.TextField()
    cover = models.ImageField(upload_to='covers', blank=True, null=True)
    category = models.ForeignKey(Category)
    author = models.ForeignKey(Author)
    rate = models.ManyToManyField(User, related_name='rates', through="RateUserBook", null=True)
    readStatus = models.ManyToManyField(User, related_name='status', through="BookState", null=True)

    class Meta:
        ordering = ['-id']

    def __str__(self):
        return self.title


class RateUserBook(models.Model):
    user = models.ForeignKey(User)
    book = models.ForeignKey(Book)
    rate = models.IntegerField(
        default=1,
        validators=[MaxValueValidator(5), MinValueValidator(1)]
    )


class BookState(models.Model):
    STATUS = (('0', 'read'), ('1', 'Currently reading'), ('2', 'Want to read'))
    user = models.ForeignKey(User)
    book = models.ForeignKey(Book)
    statues = models.CharField(max_length=1, choices=STATUS , default='0')


class UserProfile(models.Model):
    user = models.OneToOneField(User)
    avatar = models.ImageField(upload_to='avatars', blank=True, null=True)
    authors = models.ManyToManyField(Author)

    def __unicode__(self):
        return self.user.username
