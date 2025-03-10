from django.shortcuts import render
from .models import Database
from .serializers import DatabaseSerializer
from rest_framework import generics


class DatabaseCreate(generics.ListCreateAPIView):
    queryset = Database.objects.all()
    serializer_class = DatabaseSerializer


class DatabaseDelete(generics.RetrieveUpdateDestroyAPIView):
    queryset = Database.objects.all()
    serializer_class = DatabaseSerializer