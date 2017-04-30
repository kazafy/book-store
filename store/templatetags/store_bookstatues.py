from django import template
from  ..models import *
register = template.Library()


@register.simple_tag
def get_statues(b, user):
    b = b.bookstate_set.filter(user=user).first()
    if b:
        return b.statues
    else:
        return "2"