#include <memory>
#include <vector>
#include <string>
#include <iostream>
#include <fstream>
#include "Stream.h"
#include "AtspFile.h"
#include "TabuAlgorithm.h"

#define TESTFILESPATH "testfiles/"

/** prints content of the options vector in menu-like appearance */
void Stream::printMenu(const std::vector<std::string> &options)
{
	auto a = 1;
	for (auto option : options)
	{
		std::cout << "\t" << a++ << ". " << option << std::endl;
	}
	std::cout << "\t0. Exit" << std::endl;
}

/** prints given text */
void Stream::print(const std::string text)
{
	std::cout << std::endl
			  << text << std::endl;
}

/** prints result of tabu algorithm */
void Stream::printTS(const std::shared_ptr<TabuAlgorithm> tabu)
{
	float er = (abs(tabu->getOptimal() - tabu->getFinalCost()) / (float)tabu->getOptimal()) * 100;
	std::string path = "";
	for (auto i : tabu->getFinalPath())
		path += std::to_string(i) + " ";
	std::cout << "Path: " << path << std::endl
			  << "Cost: " << tabu->getFinalCost() << std::endl
			  << "Time: " << tabu->getFinalTime() << " s" << std::endl
			  << "Relative error: " << er << std::endl;
}

void Stream::printSA(const std::shared_ptr<SimulatedAnnealing> sa)
{
	float er = (abs(sa->getOptimal() - sa->getFinalCost()) / (float)sa->getOptimal()) * 100;
	std::string path = "";
	for (auto i : sa->getFinalPath())
		path += std::to_string(i) + " ";
	std::cout << "Path: " << path << std::endl
			  << "Cost: " << sa->getFinalCost() << std::endl
			  << "Time: " << sa->getFinalTime() << " s" << std::endl
			  << "Relative error: " << er << std::endl
			  << "Starting temperature: " << sa->getStartingTemperature() << std::endl
			  << "Ending temperature: " << sa->getCurrentTemperature() << std::endl;
}

void Stream::printGA(const std::shared_ptr<GeneticAlgorithm> ga)
{
	float er = (abs(ga->getOptimal() - ga->getFinalCost()) / (float)ga->getOptimal()) * 100;
	std::string path = "";
	for (auto i : ga->getFinalPath())
		path += std::to_string(i) + " ";
	std::cout << "Cost: " << ga->getFinalCost() << std::endl
			  << "Relative error: " << er << std::endl;
}

/** scans user input (allows only numbers >0 and <limit) */
int Stream::scanInt(const int limit)
{
	int ret = -1;
	while (ret < 0 || ret > limit)
	{
		std::cout << "Choice: ";
		std::cin >> ret;
		while (std::cin.fail())
		{
			std::cout << "Choice: ";
			std::cin.clear();
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
			std::cin >> ret;
		}
	};
	return ret;
}

float Stream::scanFloat(const float limit)
{
	float ret = -1;
	while (ret < 0 || ret > limit)
	{
		std::cout << "Choice: ";
		std::cin >> ret;
		while (std::cin.fail())
		{
			std::cout << "Choice: ";
			std::cin.clear();
			std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
			std::cin >> ret;
		}
	};
	return ret;
}

/** opens .atsp file and returns its content */
std::shared_ptr<AtspFile> Stream::openFile(const std::string filename)
{
	/** if file extention is not .atsp return nothing */
	if (filename.substr(filename.length() - 5) != ".atsp")
		return nullptr;

	/** load file */
	std::ifstream in(TESTFILESPATH + filename);

	/** if file could not be opened return nothing */
	if (!in)
		return nullptr;

	/** vars for atsp file */
	std::vector<std::vector<int>> cities;
	int size;
	int opt;
	std::string buf;
	/** load header */
	in >> opt;
	in >> size;
	in >> buf;
	if (buf == "atsp")
	{
		/** load cost matrix */
		for (auto i = 0; i < size; i++)
		{
			cities.push_back(std::vector<int>(size, 0));
			for (auto j = 0; j < size; j++)
			{
				in >> cities[i][j];
				if (i == j)
					cities[i][j] = -1;
			}
		}
		in.close();
	}
	else
	{
		in.close();
		return nullptr;
	}
	return std::make_shared<AtspFile>(cities, size, opt);
}

/** prints content of .atsp file */
void Stream::printAtsp(const std::shared_ptr<AtspFile> atsp)
{
	if (atsp != nullptr)
	{
		print("Size: " + std::to_string(atsp->getSize()));
		print("Optimal cost: " + std::to_string(atsp->getOptimal()));
		std::string text = "";
		for (auto row : atsp->getCities())
		{
			for (auto val : row)
			{
				text += std::to_string(val) + "\t";
			}
			text += "\n";
		}
		print("Cost matrix:\n" + text);
	}
}