#ifndef SIMULATEDANNEALING_H
#define SIMULATEDANNEALING_H

/**
 * Function: Solve TSP using Tabu Search algorithm
 * 
 * Derives from MetaheuristicAlgorithm, that contains necessary
 *  data and methods (AtspFile -> SimulatedAnnealing -> TabuAlgorithm)
 */


#include <memory>
#include "AtspFile.h"
#include "Algorithm.h"

class SimulatedAnnealing : public Algorithm {
public:
    SimulatedAnnealing(
        const std::shared_ptr<AtspFile> atsp,
        const float coolingRatio_,
        const int stop_
    );
    void compute();
    float getStartingTemperature();
    float getCurrentTemperature();
private:
    void insert(std::vector<int>& path, const int i, const int j) = delete;
    void invert(std::vector<int>& path, const int i, const int j) = delete;
    float startingTemperature;
    float startingTemperatureRatio = 10;
    float currentTemperature;
    float coolingTemperature;
    float coolingRatio;
    void setStartingTemperature(const int cost);
    float probability(const int cost, const float currentTemperature);
    void decreaseTemperature(float& currentTemperature);
};

#endif