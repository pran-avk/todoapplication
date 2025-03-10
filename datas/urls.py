from django.contrib import admin
from django.urls import path
from .views import DatabaseCreate,DatabaseDelete

urlpatterns = [path('',DatabaseCreate.as_view()),
            path('<int:pk>/',DatabaseDelete.as_view())]