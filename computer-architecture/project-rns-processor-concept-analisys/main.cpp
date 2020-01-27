#include <iostream>
#include "RNS.cpp"


int main() {
  double a, b;
  int wybor;
  char znak;
  while(true) {
      std::cout << "\n";
      std::cout << "Wprowadz 1 liczbe RNS: ";
      std::cin >> a;
      std::cout << "Wprowadz 2 liczbe RNS: ";
      std::cin >> b;
      std::cout << "Wybierz operacje: \n";
      std::cout << "1. Dodawanie \n";
      std::cout << "2. Odejmowanie \n";
      std::cout << "3. Mnożenie \n";
      std::cout << "4. Dzielenie \n";
      std::cout << "5. Wyjdz \n";
      std::cin >> wybor;
      if(wybor == 5) break;
      RNS rns(a);
      RNS rns2(b);
      RNS rns3 = RNS();
      double wynik;
      /*for(int i = 0; i < rns.M_SIZE; i++){
        std::cout << std::setw(3) << rns.M[i];
      }*/
      std::cout << "\nWprowadzone liczby w RNS: \n" << rns << rns2 << std::endl;
      if (wybor == 1) {
          rns3 = rns + rns2;
          wynik = (double) rns + (double) rns2;
          znak = '+';
      } else if (wybor == 2) {
          rns3 = rns - rns2;
          wynik = (double) rns - (double) rns2;
          znak = '-';
      } else if (wybor == 3) {
          rns3 = rns * rns2;
          wynik = (double) rns * (double) rns2;
          znak = '*';
      } else if (wybor == 4) {
          rns3 = rns / rns2;
          wynik = (double) rns / (double) rns2;
          znak = '/';
      }
      std::cout.precision(4);
      std::cout << "Wynik dzialania w RNS: " << "\n";
      std::cout << std::fixed << (double) rns << " " << znak << " " << (double) rns2 << " = " << (double) rns3 << "\n";
      std::cout << "Wynik dzialania w systemie dziesietnym: " << "\n";
      std::cout << std::fixed << (double) rns << " " << znak << " " << (double) rns2 << " = " << wynik << "\n";
      std::cout << "\n Wynik w RNS: ";
      std::cout << std::endl << rns3;
  }
  return 0;
}
