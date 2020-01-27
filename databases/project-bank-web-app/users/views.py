from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
from django.contrib.auth.decorators import login_required
from client.models import City
from .forms import *


@login_required
def delete_user(request):
    if request.method == 'POST':
        request.user.is_active = False
        request.user.save()
        messages.success(request, 'Successfully deleted account!')
        return redirect('home')
    else:
        return render(request, "users/confirm-delete.html")


def register(request):
    if request.method == 'POST':
        formA = UserRegisterForm(request.POST)
        formB = CityForm(request.POST)
        formC = AddressForm(request.POST)
        post_code = request.POST.get('postal_code')
        city = City.objects.filter(postal_code=post_code).first()
        if formA.is_valid() and (formB.is_valid or city) and formC.is_valid():
            a = formA.save(commit=False)
            if not city:
                b = formB.save()
                city = b
            c = formC.save(commit=False)
            c.city = city
            c.save()
            a.address = c
            a.save()
            username = formA.cleaned_data.get('username')
            messages.success(request, 'Successfully created account!')
            return redirect('home')
    else:
        formA = UserRegisterForm()
        formB = CityForm()
        formC = AddressForm()
    return render(request, 'users/register.html', {'formA': formA, 'formB': formB, 'formC': formC})


@login_required
def profile(request):
    return render(request, 'users/profile.html')


@login_required
def edit_profile(request):
    if request.method == 'POST':
        formA = UserEditForm(request.POST, instance=request.user)
        formB = CityForm(request.POST, instance=request.user.address.city)
        formC = AddressForm(request.POST, instance=request.user.address)
        post_code = request.POST.get('postal_code')
        city = City.objects.filter(postal_code=post_code).first()
        if formA.is_valid() and (formB.is_valid or city) and formC.is_valid():
            a = formA.save(commit=False)
            if not city:
                b = formB.save()
                city = b
            c = formC.save(commit=False)
            c.city = city
            c.save()
            a.address = c
            a.save()
            messages.success(request, 'Successfully changed account!')
            return redirect('profile')
    else:
        formA = UserEditForm(instance=request.user)
        formB = CityForm(instance=request.user.address.city)
        formC = AddressForm(instance=request.user.address)
    return render(request, 'users/edit_profile.html', {'formA': formA, 'formB': formB, 'formC': formC})


@login_required
def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            messages.success(
                request, 'Your password was successfully changed!')
            return redirect('profile')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'users/change_password.html', {
        'form': form
    })


@login_required
def creditworthiness(request):
    if request.method == 'POST':
        form = CreditworthinessForm(
            request.POST, instance=request.user.creditworthiness)
        if form.is_valid():
            creditworthinessform = form.save()
            request.user.creditworthiness = creditworthinessform
            request.user.save()
            messages.success(
                request, 'Changes saved!')
            return redirect('profile')
        else:
            messages.error(request, 'Please correct the error below.')
    else:
        form = CreditworthinessForm(instance=request.user.creditworthiness)
    return render(request, 'users/creditworthiness.html', {
        'form': form
    })
