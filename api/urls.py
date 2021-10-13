from django.contrib import admin
from django.urls import path
from api.views import version


urlpatterns = [
    path('version', version)
]