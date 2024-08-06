# Generated by Django 5.0.2 on 2024-05-21 14:11

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movieapp', '0008_trailer_email_alter_comment_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='trailer',
            name='email',
        ),
        migrations.AlterField(
            model_name='comment',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='movieapp.user'),
        ),
    ]
