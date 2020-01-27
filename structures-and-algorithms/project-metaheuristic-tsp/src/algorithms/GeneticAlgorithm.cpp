#include <vector>
#include <iostream>
#include <algorithm>
#include "GeneticAlgorithm.h"
#include "TimeMeasure.h"

using Vector2D = std::vector<std::vector<int>>;

unsigned GeneticAlgorithm::getGenerationNumber() { return generationNumber; }

/** ctor */
GeneticAlgorithm::GeneticAlgorithm(
    const unsigned populationSize_,
    const double crossFactor_,
    const double mutationFactor_,
    const std::shared_ptr<AtspFile> atsp,
    const int stop_)
{
    cities = atsp->getCities();
    size = atsp->getSize();
    optimal = atsp->getOptimal();
    populationSize = populationSize_;
    crossFactor = crossFactor_;
    mutationFactor = mutationFactor_;
    stop = stop_;
}

void GeneticAlgorithm::compute()
{
    generationNumber = 0;
    Vector2D population;

    std::vector<int> path;
    clearPath(path);
    for (unsigned i = 0; i < populationSize; i++)
    {
        randomShuffle(path);
        population.push_back(path);
    }
    cleanPopulation(population);

    TimeMeasure time;
    time.start();
    while (time.getTime() < stop)
    {
        generationNumber++;
        unsigned tmpSize = population.size();
        for (unsigned i = 0; i < tmpSize; i++)
        {
            if (static_cast<double>(rand()) / RAND_MAX < mutationFactor)
            {
                int r1, r2;
                getRandomValues(r1, r2, population[i].size());
                invert(population[i], r1, r2);
            }
            if (static_cast<double>(rand()) / RAND_MAX < crossFactor)
            {
                int r1, r2;
                getRandomValues(r1, r2, populationSize);
                std::vector<int> child1 = PMCrossover(population[r1], population[r2]);
                std::vector<int> child2 = PMCrossover(population[r2], population[r1]);
                population.push_back(child1);
                population.push_back(child2);
            }
        }
        cleanPopulation(population);

        time.end();
    }
    finalPath = population[0];
    finalCost = calculatePathCost(finalPath);
}

void GeneticAlgorithm::cleanPopulation(Vector2D &population)
{
    auto func = [&](std::vector<int> p1, std::vector<int> p2) -> bool {
        return calculatePathCost(p1) < calculatePathCost(p2);
    };
    std::sort(population.begin(), population.end(), func);
    while (population.size() != populationSize)
    {
        population.erase(population.end() - 1);
    }
}

std::vector<int> GeneticAlgorithm::PMCrossover(const std::vector<int> &p1, const std::vector<int> &p2)
{
    std::vector<int> child(p1.size(), -1);
    int r1, r2;
    getRandomValues(r1, r2, p1.size());
    if (r2 < r1)
        std::swap(r1, r2);
    std::vector<int> blacklist;
    for (auto i = r1; i < r2; i++)
        child[i] = p1[i];
    for (auto i = r1; i < r2; i++)
    {
        auto it3 = std::find(child.begin(), child.end(), p2[i]);
        if (it3 == child.end())
        {
            int index = i;
            while ((index >= r1 && index < r2))
            {
                auto it = std::find(p2.begin(), p2.end(), p1[index]);
                index = it - p2.begin();
            }
            child[index] = p2[i];
        }
    }
    for (unsigned i = 0; i < p2.size(); i++)
    {
        if (child[i] == -1)
            child[i] = p2[i];
    }
    return child;
}