from client.models import Request, Account, CreditAccount, Card, TransactionHistory
from django.shortcuts import render, redirect, get_object_or_404, get_list_or_404
from django.contrib import messages
from django.contrib.admin.views.decorators import staff_member_required


@staff_member_required
def transaction_history(request):
    transactions = get_list_or_404(TransactionHistory)
    context = {
        'transactions': transactions
    }
    return render(request, 'client/transaction_history.html', context)


@staff_member_required
def request_info(request, rot):
    if int(rot) != 3:
        requestType = Request.REQUEST_TYPES[int(rot)][0]
        requests = Request.objects.filter(
            request_type=requestType, is_verified=False)
    else:
        requests = Request.objects.filter(is_verified=True)
        requestType = 'Verified requests'
    requests = list(requests)
    requests.sort(key=lambda r: r.send_date, reverse=True)
    context = {
        'requests': requests,
        'header': requestType,
    }
    return render(request, 'worker/request_info.html', context)


@staff_member_required
def request_details(request, rid):
    user_request = get_object_or_404(Request, id=rid)
    context = {
        'user_request': user_request
    }
    return render(request, 'worker/request_details.html', context)


@staff_member_required
def request_confirm(request, rid):
    user_request = get_object_or_404(Request, id=rid)
    if request.method == 'POST':
        if user_request.request_type == 'Credit request':
            account = Account.objects.create(
                user=user_request.client_data, account_type='Credit', balance=-user_request.credit_amount)
            credit_account = CreditAccount.objects.create(
                account_number=account, interest=0.5, credit_limit=500)
            user_request.credit_account_number.balance += user_request.credit_amount
            user_request.credit_account_number.save()
        else:
            account = Account.objects.create(
                user=user_request.client_data, account_type='Credit account')
            credit_account = CreditAccount.objects.create(
                account_number=account, interest=0.5, credit_limit=500)
            card = Card.objects.create(account_number=account)
        user_request.is_accepted = True
        user_request.is_verified = True
        user_request.worker_data = request.user
        user_request.save()
        messages.info(request, 'Request accepted.')
        return redirect('worker_home', rot=0)
    context = {
        'user_request': user_request,
    }
    return render(request, "worker/request_confirm.html", context)


@staff_member_required
def request_decline(request, rid):
    user_request = get_object_or_404(Request, id=rid)
    if request.method == 'POST':
        user_request.is_accepted = False
        user_request.is_verified = True
        user_request.worker_data = request.user
        user_request.save()
        messages.info(request, 'Request decined.')
        return redirect('worker_home', rot=0)
    context = {
        'user_request': user_request,
    }
    return render(request, "worker/request_decline.html", context)


@staff_member_required
def request_verify(request, rid):
    user_request = get_object_or_404(Request, id=rid)
    if request.method == 'POST':
        user_request.is_verified = True
        user_request.worker_data = request.user
        user_request.save()
        messages.info(request, 'Request verified.')
        return redirect('worker_home', rot=0)
    context = {
        'user_request': user_request,
    }
    return render(request, "worker/request_verify.html", context)
