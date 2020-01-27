#ifndef TABUALGORITHM_H
#define TABUALGORITHM_H

/**
 * Function: Solve TSP using Tabu Search algorithm
 * 
 * Derives from Algorithm, that contains necessary
 *  data and methods (AtspFile -> Algorithm -> TabuAlgorithm)
 */

#include <memory>
#include "AtspFile.h"
#include "Proximity.h"
#include "Algorithm.h"

class TabuAlgorithm : public Algorithm {
public:
    TabuAlgorithm(
        const std::shared_ptr<AtspFile> atsp, 
        const Proximity::Proximity proximity_, 
        const int stop_
    );
    void compute() override; 
private:
    void clear();
    void clearTabuList();
    void pathTransition(std::vector<int>& path, const int i, const int j);
    void decreaseTabu();
    void increaseTabu(const int i, const int j);
    void diversivication(const int cost);
    Proximity::Proximity proximity;
    std::vector<std::vector<int>> tabuList;
    std::vector<int> path;
    int cost;
    int div;
    int maxDiv;
};
#endif