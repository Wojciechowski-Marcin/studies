from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from client.models import *
from users.forms import *


@login_required
def delete_account(request, oid):
    account = get_object_or_404(Account, id=oid)
    if account.user == request.user:
        if request.method == 'POST':
            account.is_active = False
            account.save()
            messages.success(request, 'Successfully deleted account!')
            return redirect('home')
        context = {
            'object': account,
            'text': "You will lose all money on this account! Current balance: " + str(account.balance) + " " + account.currency
        }
        return render(request, "client/confirm-delete.html", context)
    return render(request, "users/validation_error.html")


@login_required
def delete_card(request, oid, coid):
    account = get_object_or_404(Account, id=oid)
    card = get_object_or_404(Card, id=coid)
    if account.user == request.user and card.account_number == account:
        if request.method == 'POST':
            card.delete()
            messages.success(request, 'Successfully deleted card!')
            return redirect('account', oid=oid)
        context = {
            'object': card,
        }
        return render(request, "client/confirm-delete.html", context)
    return render(request, "users/validation_error.html")


@login_required
def home(request):
    accounts = Account.objects.filter(user=request.user, is_active=True)
    context = {
        'accounts': accounts
    }
    return render(request, 'client/home.html', context)


@login_required
def send_request(request):
    if request.method == 'POST':
        form = RequestForm(request.POST)
        if form.is_valid():
            requestform = form.save(commit=False)
            requestform.client_data = request.user
            requestform.save()
            messages.success(
                request, 'Request was successfully sent!')
            return redirect('home')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = RequestForm()
    context = {
        'form': form,
        'title': "Send request",
        'button_name': "Submit"
    }
    return render(request, 'client/form.html', context)


@login_required
def my_requests(request):
    requests = Request.objects.filter(client_data=request.user)
    context = {
        'requests': requests
    }
    return render(request, 'client/my_requests.html', context)


@login_required
def user_request_details(request, rid):
    user_request = get_object_or_404(Request, id=rid)
    context = {
        'user_request': user_request
    }
    return render(request, 'client/user_request_details.html', context)


@login_required
def open_account(request):
    if request.method == 'POST':
        form = AccountForm(request.POST)
        if form.is_valid():
            accountform = form.save(commit=False)
            accountform.user = request.user
            accountform.save()
            messages.success(
                request, 'Account was successfully opened!')
            return redirect('home')
        else:
            messages.error(
                request, 'Something went wrong. Please, correct mistakes.')
    else:
        form = AccountForm()
    context = {
        'form': form,
        'title': "Open account",
        'button_name': "Submit"
    }
    return render(request, 'client/form.html', context)


@login_required
def edit_account(request, oid):
    account = get_object_or_404(Account, id=oid)
    if request.method == 'POST':
        formA = AccountEditForm(request.POST, instance=account)

        if formA.is_valid():
            a = formA.save()
            messages.success(
                request, 'Successfully changed your account settings!')
            return redirect('account', oid=oid)
    else:
        formA = AccountEditForm(instance=account)
    context = {
        'form': formA,
        'title': "Edit account",
        'button_name': "Save changes"
    }
    return render(request, 'client/form.html', context)


@login_required
def open_credit_account(request):
    if request.method == 'POST':
        form = CreditworthinessForm(
            request.POST, instance=request.user.creditworthiness)
        formB = RequestCreditForm(request.POST)
        if form.is_valid() and formB.is_valid():
            creditworthinessform = form.save()
            request.user.creditworthiness = creditworthinessform
            request.user.save()
            requestform = formB.save(commit=False)
            requestform.client_data = request.user
            requestform.request_type = 'Credit request'
            requestform.request_title = 'Credit request'
            requestform.save()
            messages.success(
                request, 'Request sent!')
            return redirect('home')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = CreditworthinessForm(instance=request.user.creditworthiness)
        formB = RequestCreditForm()
        accounts = Account.objects.filter(
            user=request.user, is_active=True, currency='PLN')
        formB.fields['credit_account_number'].queryset = accounts
    context = {
        'form': form,
        'formB': formB,
        'title': "Request credit",
        'button_name': "Submit"
    }
    return render(request, 'client/form.html', context)


@login_required
def request_credit_card(request):
    if request.method == 'POST':
        form = CreditworthinessForm(
            request.POST, instance=request.user.creditworthiness)
        formB = RequestForm(request.POST)
        if form.is_valid() and formB.is_valid():
            creditworthinessform = form.save()
            request.user.creditworthiness = creditworthinessform
            request.user.save()
            requestform = formB.save(commit=False)
            requestform.client_data = request.user
            requestform.request_type = 'Credit card request'
            requestform.request_title = 'Credit card request'
            requestform.save()
            messages.success(
                request, 'Request sent!')
            return redirect('home')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = CreditworthinessForm(instance=request.user.creditworthiness)
        formB = RequestForm()
    context = {
        'form': form,
        'formB': formB,
        'title': "Request credit card",
        'button_name': "Submit"
    }
    return render(request, 'client/form.html', context)


@login_required
def transaction_history(request, oid):
    account = get_object_or_404(Account, id=oid)
    if account.user == request.user:
        transaction = TransactionHistory.objects.filter(
            destination_bank_account_number=account.account_number)
        transaction2 = TransactionHistory.objects.filter(
            source_bank_account=account)
        transactions = list(transaction) + list(transaction2)
        transactions.sort(key=lambda t: t.send_date)
        context = {
            'account': account,
            'transactions': transactions
        }
        return render(request, 'client/transaction_history.html', context)
    return render(request, "users/validation_error.html")


@login_required
def order_card(request, oid):
    account = get_object_or_404(Account, id=oid)
    if account.user == request.user:
        if request.method == 'POST':
            form = CardForm(request.POST)
            if form.is_valid():
                card = form.save(commit=False)
                card.account_number = account
                card.save()
                messages.success(
                    request, 'Card was successfully ordered!')
                return redirect('account', oid=oid)
            else:
                messages.error(request, 'Please correct the error below.')
        else:
            form = CardForm()
        context = {
            'account': account,
            'form': form,
            'title': "Order account card",
            'button_name': "Submit"
        }
        return render(request, 'client/form.html', context)
    return render(request, "users/validation_error.html")


@login_required
def account(request, oid):
    account = get_object_or_404(Account, id=oid)
    if account.user == request.user:
        if account.user == request.user:
            cards = Card.objects.filter(account_number_id=oid)
            context = {
                'account': account,
                'cards': cards
            }
        return render(request, 'client/account.html', context)
    return render(request, "users/validation_error.html")


@login_required
def card(request, oid, coid):
    account = get_object_or_404(Account, id=oid)
    card = get_object_or_404(Card, id=coid)
    if account.user == request.user and card.account_number == account:
        context = {
            'account': account,
            'card': card
        }
        return render(request, 'client/card.html', context)
    return render(request, "users/validation_error.html")


@login_required
def edit_card(request, oid, coid):
    account = get_object_or_404(Account, id=oid)
    card = get_object_or_404(Card, id=coid)
    if account.user == request.user and card.account_number == account:
        if request.method == 'POST':
            formA = EditCardForm(request.POST, instance=card)
            if formA.is_valid():
                a = formA.save()
                messages.success(
                    request, 'Successfully changed your card settings!')
                return redirect('card', oid=oid, coid=coid)
        else:
            formA = EditCardForm(instance=card)
        context = {
            'form': formA,
            'title': "Edit card",
            'button_name': "Save changes"
        }
        return render(request, 'client/form.html', context)
    return render(request, "users/validation_error.html")


@login_required
def make_transaction(request):
    accounts = Account.objects.filter(is_active=True)
    if request.method == 'POST':
        form = TransactionHistoryForm(request.POST)
        dst_account = Account.objects.filter(
            account_number=form['destination_bank_account_number'].value()).first()
        src_account = Account.objects.filter(
            id=form['source_bank_account'].value()).first()
        amount = form['amount'].value()
        credit_limit = CreditAccount.objects.filter(
            account_number=src_account).first()
        print(float(amount))
        if float(amount) != 0 and dst_account in accounts and dst_account != src_account and dst_account.currency == src_account.currency and src_account.account_type != 'Credit' and (((src_account.account_type == 'Normal account' or src_account.account_type == 'Saving account') and src_account.balance >= float(amount)) or (src_account.account_type == 'Credit account' and src_account.balance+credit_limit >= float(amount))):
            if form.is_valid():
                transaction = form.save(commit=False)
                transaction.source_bank_account = src_account
                transaction.save()
                messages.success(
                    request, 'Request was successfully sent!')
                return redirect('home')
            else:
                messages.error(
                    request, 'Form is not valid!')
        else:
            messages.error(
                request, "Can't make transfer between given accounts!")
    else:
        form = TransactionHistoryForm()
        user_accounts = Account.objects.filter(
            user=request.user, is_active=True).filter(~Q(account_type='Credit'))
        form.fields['source_bank_account'].queryset = user_accounts
    context = {
        'form': form,
        'title': "Make transaction",
        'button_name': "Send"
    }
    return render(request, 'client/form.html', context)
