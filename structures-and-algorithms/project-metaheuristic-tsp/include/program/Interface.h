#ifndef INTERFACE_H
#define INTERFACE_H

/** 
 * Function: printing user interface
 * 
 * Contains a Stream object and basic parametres 
 *  for setting up algorithms
*/

#include <vector>
#include <string>
#include <memory>
#include "Stream.h"
#include "Proximity.h"
#include "AtspFile.h"

class Interface
{
public:
  Interface();
  void main_menu();

private:
  Stream stream;
  std::string filename = "ftv47.atsp";
  int stop = 10;
  float coolingRatio = 0.98;
  Proximity::Proximity proximity = Proximity::SWAP;
  unsigned populationSize = 100;
  double crossFactor = 0.8;
  double mutationFactor = 0.01;
  std::shared_ptr<AtspFile> atsp = nullptr;

  void file_menu();
  void stop_menu();
  void proximity_menu();
  void cooling_menu();
  void population_menu();
  void cross_menu();
  void mutation_menu();
  void tabu_search();
  void simulated_annealing();
  void genetic_algorithm();
};
#endif
