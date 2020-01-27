from django.test import TestCase
from client.models import *


class UserTestCase(TestCase):
    def setUp(self):
        self.city = City.objects.create(postal_code='50-370', city='Wrocław')
        self.address = Address.objects.create(street="wybrzeże Stanisława Wyspiańskiego",
                                              house_nr=27, city=self.city)
        self.user = CustomUser.objects.create(
            password='testing321', username='Wojciechowski-Marcin', first_name='Marcin', last_name='Wojciechowski',
            email='wojc.marcin@gmail.com', pesel=1234567891, telephone=123456789, address=self.address, birth_day='2000-11-11 11:11'
        )
        self.account1 = Account.objects.create(
            user=self.user, balance=100.00, account_type='Saving account')
        self.account2 = Account.objects.create(
            user=self.user, balance=100.00, account_type='Saving account')
        self.card = Card.objects.create(account_number=self.account1)

    def test_account_number(self):
        self.assertEqual(len(self.account1.account_number), 26)
        self.assertEqual(len(self.account2.account_number), 26)

    def test_card_number(self):
        self.assertEqual(len(self.card.card_number), 16)

    def test_card_cvv_number(self):
        self.assertEqual(len(self.card.cvv), 3)

    def test_trigger(self):
        instance = TransactionHistory.objects.create(
            source_bank_account=self.account1, destination_bank_account_number=self.account2.account_number, title='tytul', amount=10.00)
        self.account2 = Account.objects.get(
            account_number=instance.destination_bank_account_number)
        self.assertEqual(self.account1.balance, 90.00)
        self.assertEqual(self.account2.balance, 110.00)
