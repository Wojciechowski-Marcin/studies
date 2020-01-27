#ifndef GENETICALGORITHM_H
#define GENETICALGORITHM_H

/**
 * Function: Genetic algorithm
 */

#include <vector>
#include <map>
#include <memory>
#include "Algorithm.h"

using Vector2D = std::vector<std::vector<int>>;

class GeneticAlgorithm : public Algorithm {
  public:
    GeneticAlgorithm(
      const unsigned populationSize_, 
      const double crossFactor_, 
      const double mutationFactor_, 
      const std::shared_ptr<AtspFile> atsp,
      const int stop_
    );

    void compute() override;
    unsigned getGenerationNumber();
  private:
    int getFinalTime() = delete;
    void swap() = delete;
    void insert() = delete;
    unsigned populationSize = 100;
    unsigned generationNumber;
    double crossFactor = 0.8;
    double mutationFactor = 0.01;
    //CrossMethod crossMethod;
    //MutationMethod mutationMethod;

    void cleanPopulation(Vector2D& population);
    //bool sortPaths(std::vector<int> p1, std::vector<int> p2);
    std::vector<int> PMCrossover(const std::vector<int>& p1, const std::vector<int>& p2);
};

#endif