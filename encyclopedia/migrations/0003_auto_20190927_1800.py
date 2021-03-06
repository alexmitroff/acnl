# Generated by Django 2.2.5 on 2019-09-27 15:00

import django.core.validators
from django.db import migrations, models
import re


class Migration(migrations.Migration):

    dependencies = [
        ('encyclopedia', '0002_auto_20190927_1736'),
    ]

    operations = [
        migrations.CreateModel(
            name='Season',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=10, verbose_name='name')),
                ('slug', models.SlugField(unique=True, validators=[django.core.validators.RegexValidator(re.compile('^[-a-zA-Z0-9_]+\\Z'), "Enter a valid 'slug' consisting of letters, numbers, underscores or hyphens.", 'invalid')], verbose_name='slug')),
                ('color', models.CharField(blank=True, help_text='Example: 120,50%,50%', max_length=100, null=True, validators=[django.core.validators.RegexValidator(re.compile('^(\\d+),\\s*([\\d.]+)%,\\s*([\\d.]+)%\\Z'), "Enter a valid 'HSL' consisting of hue 0-360, saturation 0%-100%, lightness 0%-100%", 'invalid')], verbose_name='name')),
            ],
            options={
                'verbose_name': 'season',
                'verbose_name_plural': 'seasons',
            },
        ),
        migrations.AlterModelOptions(
            name='month',
            options={'verbose_name': 'month', 'verbose_name_plural': 'monthes'},
        ),
        migrations.RenameField(
            model_name='month',
            old_name='season',
            new_name='season_old',
        ),
    ]
