from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def index(request):
    print(request.path)
    return HttpResponse(f"<h1>url: {request.path}</h1><p>HTTP 200, everything works!</p>")