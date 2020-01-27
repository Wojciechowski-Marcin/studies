from django.contrib import admin
from .models import *

admin.site.register(CustomUser)
admin.site.register(Address)
admin.site.register(City)
admin.site.register(Account)
admin.site.register(Creditworthiness)
admin.site.register(Card)
admin.site.register(TransactionHistory)
admin.site.register(Request)
admin.site.register(SavingAccount)
admin.site.register(CreditAccount)
