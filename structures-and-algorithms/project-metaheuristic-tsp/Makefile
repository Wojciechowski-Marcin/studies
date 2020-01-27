.PHONY: compile clean

SRCPATH = src/program/*.cpp src/algorithms/*.cpp src/enum/*.cpp
CFLAGS = -Iinclude/algorithms -Iinclude/enum -Iinclude/program -Wall -Wextra -Wpedantic -std=c++17
PROJECTNAME = TSP

compile: $(SRCPATH)
	g++ $(SRCPATH) -o $(PROJECTNAME) $(CFLAGS) -g

clean:
	rm $(PROJECTNAME)
