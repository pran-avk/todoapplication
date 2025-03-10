from .models import Database
from rest_framework import serializers

class DatabaseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Database
        fields = ['id', 'title', 'desc','isDone','date']