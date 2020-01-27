# Operating systems - laboratory

Tasks made during operating systems 2 course

## Contents

### Lab1: Basic bash scripting

- Zad1_w
  - download contents from URLs placed in lista.txt
  - display URLs before downloading
- Zad2_w
  - generate files with the given range (ex. arguments 10 and 13 results in creating files `file10`, `file11`, `file12` and `file13`)
- Zad1
  - Display names and count executable files in directory given as an argument
- Zad2
  - Display names and delete all empty files in directory given as an argument
- Zad3
  - Move only readable files from one directory to another (2 arguments)
- Zad4
  - Merge files from the list (name given as arg)
  - Content of the file should be preceded by it's name

### Lab2: Links

- Zad1
  - Count all symlinks in directory (arg) and count how many of them link to existing files/dirs
- Zad2
  - Create file in the directory where the script is (regardless of the place of executing)
- Zad3
  - Create hard links to every file in source directory (arg1) and place them in destination directory (arg2)
- Zad4
  - In given directory (arg) convert every symlink to regular file to hard links

### Lab3: find

- Zad3
  - In given directory (arg) display:
    - number of directories
    - number of files with `.sh` and `.pl` extensions
    - number of files containing `src/` directory in their path
    - number of files which name does not start with letter `b`
    - number of files with extension `.c` bigger than 100KB
- Zad4
  - Sort and display numbers in file given as an argument
- Zad5
  - Display lines 20-30 from file given as an argument
- Zad6
  - Display only processes started by current user

### Lab4: grep and awk

- grep.sh file contains instructions
- awk1
  - Display files with line numbers
- awk2
  - Display lines 5-10
- awk3
  - Convert lines that contain numbers to upper case

### Lab5: python

- python.py
  - display `PID` of current process
  - display `PWD` environment variable
  - display files and directories of current directory
  - display files and directories of directory given as first script argument
  - display files recursivly from directory given as second argument
  - change permissions of a file given as third argument to `rwxrwxrwx`
  - create directory and 100 files with different names inside
  - change every filename to filename.copy in directory given as fourth argument
- bash.sh
  - set environment variable `XYZ` in bash and display it with python
  - display files and directories of current directory

### Lab5: python regex

- python.py
  - display all files starting with `file\_`
  - display all files starting with any small letter
  - display all files ending with at least 3 numbers
  - display all files without `\_`
  - display all numbers in a file
