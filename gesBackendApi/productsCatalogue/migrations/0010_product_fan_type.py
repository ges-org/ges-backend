# Generated by Django 4.2.14 on 2024-08-07 04:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('productsCatalogue', '0009_remove_product_fan_type_remove_product_img_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='fan_type',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='fantype', to='productsCatalogue.fantype'),
        ),
    ]
