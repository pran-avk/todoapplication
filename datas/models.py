from django.db import models

class Database(models.Model):
    title=models.CharField(max_length=100) 
    desc=models.CharField(max_length=255)
    isDone=models.BooleanField(default=False)
    date=models.DateTimeField(auto_now_add=True)