from django import forms
from client.models import *
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
import datetime


class UserRegisterForm(UserCreationForm):
    email = forms.EmailField()
    birth_day = forms.DateField(
        input_formats=["%d/%m/%Y"], help_text='Date in format dd/mm/yyyy')

    class Meta:
        model = CustomUser
        fields = ['first_name', 'last_name', 'pesel', 'birth_day',
                  'username', 'email', 'password1', 'password2', 'telephone']


class UserEditForm(UserChangeForm):
    email = forms.EmailField()
    password = None

    class Meta:
        model = CustomUser
        fields = ['first_name', 'last_name',
                  'username', 'email', 'telephone']


class CityForm(forms.ModelForm):
    postal_code = forms.CharField(help_text='Postal code in format XX-XXX')

    class Meta:
        model = City
        fields = ['postal_code', 'city']


class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = ['street', 'house_nr', 'apartment_nr']


class RequestForm(forms.ModelForm):
    class Meta:
        model = Request
        fields = ['request_title', 'request_text']


class CardForm(forms.ModelForm):
    class Meta:
        model = Card
        fields = ['transaction_limit', 'is_nfc']


class EditCardForm(forms.ModelForm):
    class Meta:
        model = Card
        fields = ['transaction_limit', 'is_nfc', 'is_active']


class CreditworthinessForm(forms.ModelForm):
    class Meta:
        model = Creditworthiness
        fields = ['earnings_per_month', 'working_time', 'contract_type']


class TransactionHistoryForm(forms.ModelForm):
    class Meta:
        model = TransactionHistory
        fields = ['source_bank_account',
                  'destination_bank_account_number', 'amount', 'title']


class AccountForm(forms.ModelForm):
    class Meta:
        model = Account
        fields = ['transaction_limit', 'currency', 'account_type']


class AccountEditForm(forms.ModelForm):
    class Meta:
        model = Account
        fields = [
            'transaction_limit', 'is_active',
        ]


class RequestCreditForm(forms.ModelForm):
    class Meta:
        model = Request
        fields = ['request_text', 'credit_account_number', 'credit_amount']
