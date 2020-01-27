from django.apps import AppConfig
from django.db.models.signals import post_migrate
from client.db_create_view import create_view


class ClientConfig(AppConfig):
    name = 'client'

    def ready(self):
        post_migrate.connect(create_view, sender=self)
