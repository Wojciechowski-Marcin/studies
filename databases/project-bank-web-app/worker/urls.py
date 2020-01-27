from django.urls import path, re_path
from . import views as worker_views

urlpatterns = [
    path('transaction_history/',
         worker_views.transaction_history,
         name='worker_transaction_history'),
    re_path(r'^request/(?P<rot>[0-9]{1})/$',
            worker_views.request_info,
            name='worker_home'),
    re_path(r'^request/details/(?P<rid>[0-9]+)/$',
            worker_views.request_details,
            name='request_details'),
    re_path(r'^request/confirm/(?P<rid>[0-9]+)/$',
            worker_views.request_confirm,
            name='request_confirm'),
    re_path(r'^request/decline/(?P<rid>[0-9]+)/$',
            worker_views.request_decline,
            name='request_decline'),
    re_path(r'^request/verify/(?P<rid>[0-9]+)/$',
            worker_views.request_verify,
            name='request_verify'),
]
