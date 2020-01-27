#include <vector>
#include <string>
#include "Interface.h"
#include "Stream.h"
#include "AtspFile.h"
#include "TabuAlgorithm.h"
#include "SimulatedAnnealing.h"
#include "GeneticAlgorithm.h"
#define MAXSTOP 5000
#define MAXCOOLING 0.9999

/** ctor */
Interface::Interface()
{
	atsp = stream.openFile(filename);
	//stream.printAtsp(atsp);
}

/** main menu function 
 *  	calls sub_menu functions
*/
void Interface::main_menu()
{
	std::vector<std::string> options;
	unsigned choice = -1;
	while (choice != 0)
	{
		switch (choice)
		{
		case 1:
			file_menu();
			break;
		case 2:
			stop_menu();
			break;
		case 3:
			proximity_menu();
			break;
		case 4:
			cooling_menu();
			break;
		case 5:
			population_menu();
			break;
		case 6:
			cross_menu();
			break;
		case 7:
			mutation_menu();
			break;
		case 8:
			tabu_search();
			break;
		case 9:
			simulated_annealing();
			break;
		case 10:
			genetic_algorithm();
			break;
		default:
			break;
		}
		stream.print("Main menu");
		options = {
			"Load graph from file \t\tCurrent: " + filename,
			"Change stop criterion \t\tCurrent: " + std::to_string(stop),
			"Change proximity definition (TS)\tCurrent: " + Proximity::ToString(proximity),
			"Change cooling factor (SA)\t\tCurrent: " + std::to_string(coolingRatio),
			"Change population size (GA)\t\tCurrent: " + std::to_string(populationSize),
			"Change cross factor (GA)\t\tCurrent: " + std::to_string(crossFactor),
			"Change mutation factor (GA)\t\tCurrent: " + std::to_string(mutationFactor),
			"Tabu Search",
			"Simulated Annealing",
			"Genetic Algorithm",
		};
		stream.printMenu(options);
		choice = stream.scanInt(options.size());
	}
}

/** allows user to choose test file */
void Interface::file_menu()
{
	std::vector<std::string> options;
	unsigned choice = -1;
	while (choice > options.size())
	{
		stream.print("Choose file: ");
		options = {
			"ftv47.atsp",
			"ftv170.atsp",
			"rbg403.atsp",
		};
		stream.printMenu(options);
		choice = stream.scanInt(options.size());
	}

	if (choice != 0)
	{
		filename = options[choice - 1];
	}

	atsp = stream.openFile(filename);
}

/** allows user to pick time of the stop criterion */
void Interface::stop_menu()
{
	unsigned int choice = -1;
	while (choice > MAXSTOP)
	{
		stream.print("Enter new stop criterion: ");
		choice = stream.scanInt(MAXSTOP);
	}
	if (choice != 0)
	{
		stop = choice;
	}
}

/** allows user to choose proximity definition */
void Interface::proximity_menu()
{
	std::vector<std::string> options;
	unsigned int choice = -1;
	while (choice > options.size())
	{
		stream.print("Choose proximity definition: ");
		options = {
			"SWAP",
			"INSERT",
			"INVERT",
		};
		stream.printMenu(options);
		choice = stream.scanInt(options.size());
	}

	if (choice != 0)
	{
		proximity = Proximity::Proximity(choice - 1);
	}
}

/** allows user to pick time of the cooling ratio parameter */
void Interface::cooling_menu()
{
	float choice = 2.0f;
	while (choice > static_cast<float>(MAXCOOLING))
	{
		stream.print("Enter new cooling factor: ");
		choice = stream.scanFloat(MAXCOOLING);
	}
	if (choice > 0)
	{
		coolingRatio = choice;
	}
}

/** allows user to pick time of the cooling ratio parameter */
void Interface::population_menu()
{
	unsigned int choice = __INT_MAX__;
	while (choice > MAXSTOP)
	{
		stream.print("Enter new population size: ");
		choice = stream.scanInt(MAXSTOP);
	}
	if (choice > 0)
	{
		populationSize = choice;
	}
}
/** allows user to pick time of the cooling ratio parameter */
void Interface::cross_menu()
{
	float choice = 2.0f;
	while (choice > static_cast<float>(MAXCOOLING))
	{
		stream.print("Enter new cross factor: ");
		choice = stream.scanFloat(MAXCOOLING);
	}
	if (choice > 0)
	{
		crossFactor = choice;
	}
}
/** allows user to pick time of the cooling ratio parameter */
void Interface::mutation_menu()
{
	float choice = 2.0f;
	while (choice > static_cast<float>(MAXCOOLING))
	{
		stream.print("Enter new mutation factor: ");
		choice = stream.scanFloat(MAXCOOLING);
	}
	if (choice > 0)
	{
		mutationFactor = choice;
	}
}
/** calls tabu search algorithm */
void Interface::tabu_search()
{
	if (atsp != nullptr)
	{
		std::shared_ptr<TabuAlgorithm> ta = std::make_shared<TabuAlgorithm>(atsp, proximity, stop);
		ta->compute();
		stream.printTS(ta);
	}
	else
		stream.print("Graph not loaded!");
}

void Interface::simulated_annealing()
{
	if (atsp != nullptr)
	{
		std::shared_ptr<SimulatedAnnealing> sa = std::make_shared<SimulatedAnnealing>(atsp, coolingRatio, stop);
		sa->compute();
		stream.printSA(sa);
	}
	else
		stream.print("Graph not loaded!");
}

void Interface::genetic_algorithm()
{
	if (atsp != nullptr)
	{
		std::shared_ptr<GeneticAlgorithm> ga = std::make_shared<GeneticAlgorithm>(populationSize, crossFactor, mutationFactor, atsp, stop);
		ga->compute();
		stream.printGA(ga);
	}
	else
		stream.print("Graph not loaded!");
}