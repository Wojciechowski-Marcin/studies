from django.db import models
from django.db.models.signals import pre_save
from django.contrib.auth.models import AbstractUser
from django.core.validators import RegexValidator
from django.utils import timezone
import random


class City(models.Model):
    postal_code = models.CharField(max_length=6, validators=[RegexValidator(
        regex='^\d{2}-{1}\d{3}$', message='Niewlasciwy kod pocztowy! Uzyj formatu XX-XXX.', code='nomatch')])
    city = models.CharField(max_length=32)

    def __str__(self):
        return self.postal_code + " " + self.city


class Address(models.Model):
    street = models.CharField(max_length=64)
    house_nr = models.IntegerField()
    apartment_nr = models.IntegerField(null=True, blank=True)
    city = models.ForeignKey(City, on_delete=models.PROTECT)

    def __str__(self):
        return self.city.postal_code + " " + self.street + " " + str(self.house_nr) + " " + str(self.apartment_nr)


class Creditworthiness(models.Model):
    JOBE_TYPE_CW = [('Umowa o prace na czas nieokreslony', 'Umowa o prace na czas nieokreslony'),
                    ('Umowa o prace na czas okreslony',
                     'Umowa o prace na czas okreslony'),
                    ('Umowa o dzielo', 'Umowa o dzielo'),
                    ('Umowa Zlecenie', 'Umowa Zlecenie'),
                    ('Umowa Agencyjna', 'Umowa Agencyjna')]
    earnings_per_month = models.IntegerField(null=True)
    contract_type = models.CharField(
        null=True, max_length=35, choices=JOBE_TYPE_CW)
    working_time = models.IntegerField(null=True)


class CustomUser(AbstractUser):
    address = models.ForeignKey(Address, on_delete=models.PROTECT)
    pesel = models.CharField(max_length=11, unique=True, validators=[RegexValidator(
        regex='^\d{11}$', message='Niewlasciwy PESEL!', code='nomatch')])
    mothers_maiden_name = models.CharField(max_length=32, blank=True, validators=[RegexValidator(
        regex='^[a-zA-Z-]*$', message='Niewlasciwe nazwisko!', code='nomatch')])
    birth_day = models.DateTimeField(help_text="Data w formacie dd/mm/yyyy")
    telephone = models.CharField(max_length=9, unique=True, validators=[RegexValidator(
        regex='^\d{9}$', message='Niewlasciwy numer telefonu', code='nomatch')])
    creditworthiness = models.ForeignKey(
        Creditworthiness, on_delete=models.PROTECT, blank=True, null=True)

    REQUIRED_FIELDS = ['email', 'first_name',
                       'last_name', 'pesel', 'birth_day', 'telephone', 'address']
    USERNAME_FIELD = 'username'

    def __str__(self):
        return self.first_name + " " + self.last_name


class Account(models.Model):
    def rand_account_number():
        account_nr = str(random.randint(0, 9))
        for i in range(25):
            account_nr += str(random.randint(0, 9))
        return account_nr

    CURRENCIES_CHOICE = [
        ('EUR', 'EUR'),
        ('PLN', 'PLN'),
        ('USD', 'USD'),
        ('JPY', 'JPY'),
        ('GBP', 'GBP'),
        ('CHF', 'CHF'),
        ('SAR', 'SAR'),
        ('RUB', 'RUB'),
        ('KRW', 'KRW')
    ]
    ACCOUNT_TYPE_CHOICES = [
        ('Normal account', 'Normal account'),
        ('Saving account', 'Saving account')
    ]

    account_number = models.CharField(
        default=rand_account_number, max_length=26, unique=True)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    balance = models.DecimalField(default=0, max_digits=10, decimal_places=2)
    transaction_limit = models.IntegerField(default=10)
    currency = models.CharField(
        default='PLN', max_length=3, choices=CURRENCIES_CHOICE)
    is_active = models.BooleanField(default=True)
    creation_date = models.DateTimeField(default=timezone.now)
    account_type = models.CharField(
        default='Normal account', max_length=15, choices=ACCOUNT_TYPE_CHOICES)

    def __str__(self):
        return self.account_number


class Card(models.Model):
    def rand_cvv():
        cvv = str(random.randint(0, 9))
        cvv += str(random.randint(0, 9))
        cvv += str(random.randint(0, 9))
        return cvv

    def rand_card_number():
        card_nr = str(random.randint(0, 9))
        for i in range(15):
            card_nr += str(random.randint(0, 9))
        return card_nr

    account_number = models.ForeignKey(Account, on_delete=models.CASCADE)
    card_number = models.CharField(default=rand_card_number, max_length=16)
    cvv = models.CharField(default=rand_cvv, max_length=3)
    is_nfc = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    transaction_limit = models.IntegerField(default=50)

    def __str__(self):
        return self.card_number


class TransactionHistory(models.Model):
    source_bank_account = models.ForeignKey(
        Account, on_delete=models.PROTECT, related_name='source_bank_account')
    destination_bank_account_number = models.CharField(max_length=26, validators=[RegexValidator(
        regex='^[0-9]{26}$', message='Wrong account number!', code='nomatch')])
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    title = models.CharField(max_length=20)
    send_date = models.DateTimeField(default=timezone.now)


def set_balance(sender, instance, **kwargs):
    from decimal import Decimal
    instance.source_bank_account.balance -= instance.amount
    instance.source_bank_account.save()
    dst_acc = Account.objects.get(
        account_number=instance.destination_bank_account_number)
    dst_acc.balance += Decimal(instance.amount)
    dst_acc.save()


pre_save.connect(set_balance, sender=TransactionHistory)


class Request(models.Model):
    REQUEST_TYPES = [
        ('Normal request', 'Normal request'),
        ('Credit request', 'Credit request'),
        ('Credit card request', 'Credit card request'),
    ]
    worker_data = models.ForeignKey(
        CustomUser, on_delete=models.PROTECT, null=True, blank=True, related_name='worker_data')
    client_data = models.ForeignKey(
        CustomUser, on_delete=models.PROTECT, related_name='client_data')
    request_title = models.CharField(max_length=40, null=True)
    request_text = models.TextField()
    credit_amount = models.DecimalField(
        default=0, max_digits=10, decimal_places=2)
    credit_account_number = models.ForeignKey(
        Account, on_delete=models.CASCADE, null=True)
    send_date = models.DateTimeField(default=timezone.now)
    is_verified = models.BooleanField(default=False)
    is_accepted = models.BooleanField(null=True)
    request_type = models.CharField(
        max_length=20, default='Normal request', choices=REQUEST_TYPES)

    def __str__(self):
        return self.request_title


class SavingAccount(models.Model):
    account_number = models.ForeignKey(Account, on_delete=models.CASCADE)
    interest = models.DecimalField(max_digits=2, decimal_places=2)


class CreditAccount(models.Model):
    account_number = models.ForeignKey(Account, on_delete=models.CASCADE)
    interest = models.DecimalField(max_digits=2, decimal_places=2)
    credit_limit = models.CharField(max_length=7, validators=[RegexValidator(
        regex='^\d{0,7}$', message='Bledna wartosc', code='nomatch')])


class VerifiedRequestsView(models.Model):
    id = models.BigIntegerField(primary_key=True)
    worker_data = models.ForeignKey(
        CustomUser, on_delete=models.DO_NOTHING, related_name='worker_data_view')
    client_data = models.ForeignKey(
        CustomUser, on_delete=models.DO_NOTHING, related_name='client_data_view')
    request_title = models.CharField(max_length=40)
    request_text = models.TextField()
    credit_amount = models.DecimalField(max_digits=10, decimal_places=2)
    credit_account_number = models.ForeignKey(
        Account, on_delete=models.DO_NOTHING)
    send_date = models.DateTimeField()
    is_verified = models.BooleanField()
    is_accepted = models.BooleanField()
    request_type = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'client_verifiedrequests'
