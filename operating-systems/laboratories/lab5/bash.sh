#!/bin/bash
 
# Napisać następujące skrypty powłoki BASH:
# Ustawiąjący zmienną środowiskową XYZ z poziomu BASHa oraz wyświetlający jej zawartość za pomocą skryptu inline w języku python (python -c [KOMENDA]).

export XYZ="env.var"
 
python -c "import os; print(os.environ.get('XYZ'));"