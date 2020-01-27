#include <vector>
#include <random>
#include <cstdlib>
#include <iostream>
#include "TimeMeasure.h"
#include "SimulatedAnnealing.h"

using Clock1 = std::chrono::high_resolution_clock;
using Duration = std::chrono::duration<double>;

/** ctor */
SimulatedAnnealing::SimulatedAnnealing(
    const std::shared_ptr<AtspFile> atsp,
    const float coolingRatio_,
    const int stop_)
{
    cities = atsp->getCities();
    size = atsp->getSize();
    optimal = atsp->getOptimal();
    coolingRatio = coolingRatio_;
    stop = stop_;
}

float SimulatedAnnealing::getStartingTemperature() { return startingTemperature; }

float SimulatedAnnealing::getCurrentTemperature() { return currentTemperature; }

void SimulatedAnnealing::compute()
{
    /** wybierz losowo rozwiazanie */
    clearPath(finalPath);
    randomShuffle(finalPath);
    finalCost = calculatePathCost(finalPath);
    setStartingTemperature(finalCost);

    currentTemperature = startingTemperature;

    /** czas rozpoczęcia algorytmu */
    TimeMeasure time;
    time.start();

    /** główna pętla */
    while (time.getTime() <= stop)
    {
        /** stworz drugie rozwiazanie przez zamiane dwoch losowych elementow */
        std::vector<int> path = finalPath;
        int r1 = 0, r2 = 0;
        getRandomValues(r1, r2, size);
        swap(path, r1, r2);
        int cost = calculatePathCost(path);

        /** nadpisz jesli koszt nowego rozwiazania jest mniejszy lub z pewnym prawdopodobienstwem */
        float random = static_cast<float>(rand()) / RAND_MAX;
        float prob = probability(cost, currentTemperature);
        if (cost < finalCost || (random < prob && finalCost != cost))
        {
            finalPath = path;
            finalCost = cost;
            time.end();
            finalTime = time.getTime();
        }
        /** zmniejsz temperature */
        decreaseTemperature(currentTemperature);

        /** zwiększ czas wykonania funkcji */
        time.end();
    }
}

void SimulatedAnnealing::setStartingTemperature(const int cost)
{
    startingTemperature = cost * startingTemperatureRatio;
}

float SimulatedAnnealing::probability(const int cost, const float currentTemperature)
{
    return exp((static_cast<float>(finalCost) - static_cast<float>(cost)) / currentTemperature);
}

void SimulatedAnnealing::decreaseTemperature(float &currentTemperature)
{
    currentTemperature *= coolingRatio;
}
