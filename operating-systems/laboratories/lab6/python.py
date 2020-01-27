import sys
import os
import re
 
# Napisać następujące skrypty w języku python (wersja 2 lub 3 wedle uzniania):

# 1. Wyświetlający pliki oraz katalogi których nazwy rozpoczynają się na słowo file_
print("1. ")
for f in os.listdir(sys.argv[1]):
    match = re.match(r'^file_', f)
    if match:
        print(match.string)

# 2. Wyświetlający pliki oraz katalogi których nazwy zaczynają się na małą literę
print("2. ")
for f in os.listdir(sys.argv[1]):
    match = re.match(r'^[a-z]', f)
    if match:
        print(match.string)

# 3. Wyświetlający pliki oraz katalogi których nazwy kończą się na przynajmniej 3 cyfry
print("3. ")
for f in os.listdir(sys.argv[1]):
    match = re.match(r'.*[0-9]{3,}$', f)
    if match:
        print(match.string)

# 4. Wyświetlający pliki oraz katalogi których nazwy nie zawierają podkreślników
print("4. ")
for f in os.listdir(sys.argv[1]):
    match = re.match(r'^((?!\_).)*$', f)
    if match:
        print(match.string)

# 5. Wyświetlający wszystkie liczby zawarte w pliku podanym jako drugi argument skryptu. Liczbą jest dowolny ciąg cyfr. 
print("5. ")
with open(sys.argv[2], 'r') as f:
    for line in f:
        for match in re.findall(r'[0-9]+', line):
            print(match)