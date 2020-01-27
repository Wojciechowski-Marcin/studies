#ifndef STREAM_H
#define STREAM_H

/**
 * Function: Printing data, receiving user input, loading files
 */

#include <vector>
#include <string>
#include <memory>
#include "AtspFile.h"
#include "TabuAlgorithm.h"
#include "Algorithm.h"
#include "SimulatedAnnealing.h"
#include "GeneticAlgorithm.h"

class Stream
{
  public:
	void print(const std::string text);								/** prints text */
	void printMenu(const std::vector<std::string> &options);		/** prints menu with given options */
	void printAtsp(const std::shared_ptr<AtspFile> atsp);			/** prints content of atsp file */
	void printTS(const std::shared_ptr<TabuAlgorithm> tabu);		/** prints result of tabu search algorithm */
	void printSA(const std::shared_ptr<SimulatedAnnealing> sa);		/** prints result of simulated annealing algorithm */
	void printGA(const std::shared_ptr<GeneticAlgorithm> ga);		/** prints result of simulated annealing algorithm */
	int scanInt(const int limit);									/** scans numeric input */
	float scanFloat(const float limit);								/** scans floating point input */
	std::shared_ptr<AtspFile> openFile(const std::string filename); /** opens .atsp file */
};
#endif