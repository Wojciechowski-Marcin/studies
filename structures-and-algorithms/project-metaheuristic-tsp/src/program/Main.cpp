#include "Interface.h"
#include <iostream>
#include <ctime>

Interface myInterface;

int main()
{
	srand(time(NULL));
	std::cout << "Algorithms and computational complexity - project" << std::endl
			  << "Implementation of metaheuristic algorithms for the Travelling Salesman Problem" << std::endl
			  << "Author: Marcin Wojciechowski 235088" << std::endl;
	myInterface.main_menu();
}