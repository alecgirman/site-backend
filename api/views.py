from django.shortcuts import render
from django.http import JsonResponse
from config.settings import API_VERSION

# Create your views here.

def version(request):
    return JsonResponse({"version": API_VERSION})