
CC=g++
CFLAGS=-lncurses -lpthread -O3 -g
LFLAGS=-Wall -Wextra -pedantic
EXEC=pilki
IDIR=include/
SRCDIR=src/

pilki: $(SRCDIR)/*.cpp $(IDIR)/*.hpp
	$(CC) src/*.cpp $(CFLAGS) $(LFLAGS) -I $(IDIR) -o $(EXEC) 