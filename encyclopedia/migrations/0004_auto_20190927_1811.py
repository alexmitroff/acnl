# Generated by Django 2.2.5 on 2019-09-27 15:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('encyclopedia', '0003_auto_20190927_1800'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='month',
            options={'verbose_name': 'month', 'verbose_name_plural': 'months'},
        ),
        migrations.AddField(
            model_name='month',
            name='season',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='encyclopedia.Season'),
        ),
    ]
