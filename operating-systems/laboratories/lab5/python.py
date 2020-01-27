import os
import sys

# Napisać następujące skrypty w języku python (wersja 2 lub 3 wedle uzniania):

# 1. Wyświetlający PID aktualnego procesu.
os.system("echo $$")

# 2. Wyświetlający zawartość zmiennej środowiskowiej PWD.
print(os.environ.get('PWD'))

# 3. Wyświetlający zawartość (pliki i katalogi) bieżącego katalogu.
os.system("ls")

# 4. Wyświetlający zawartość (pliki i katalogi) katalogu podanego jako pierwszy argument skryptu. 
# Dodatkowo, obok nazw plików/katalgów powinien pojawić się ich rozmiar w bajtach.
if len(sys.argv) > 1:
    os.system("du -s -B1 " + sys.argv[1] + "/*")

# 5. Wyświetlający rekursywnie (os.walk) zawartość (tylko pliki) katalogu podanego jako drugi argument skryptu.
if len(sys.argv) > 2:
    for root, dirs, files in os.walk(sys.argv[2]):
        for filename in files:
            print(os.path.join(root, filename))


# 6. Zmieniajacy prawa dostepu do pliku podanego jako trzeci argument na rwxrwxrwx.
if len(sys.argv) > 3:
    os.system("chmod 777 " + sys.argv[3])


# 7. Tworzacy katalog a w nim 100 plikow o roznych nazwach.
os.system("mkdir testdir")
for i in range(100):
    os.system("touch testdir/plik" + str(i+1))


# 8. Zmieniajacy nazwy wszystkich plikow z NAZWA_PLIKU na NAZWA_PLIKU.copy w katalogu podanym jako czwarty argument pliku.
if len(sys.argv) > 4:
    for filename in os.listdir(sys.argv[4]):
        f = sys.argv[4] + "/" + filename
        os.system("mv " + f + " " + f + ".copy")