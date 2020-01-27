#include <memory>
#include <random>
#include <algorithm>
#include <iostream>
#include "TabuAlgorithm.h"
#include "AtspFile.h"
#include "Proximity.h"
#include "TimeMeasure.h"

TabuAlgorithm::TabuAlgorithm(
    const std::shared_ptr<AtspFile> atsp, 
    const Proximity::Proximity proximity_, 
    const int stop_
) {
    cities = atsp->getCities();
    size = atsp->getSize();
    optimal = atsp->getOptimal();
    proximity = proximity_;
    stop = stop_;
}

void TabuAlgorithm::compute() {
    clear();
    std::vector<int> tmpSol;
    std::vector<int> bestSol;
    finalCost = calculatePathCost(path);

    /** czas rozpoczęcia algorytmu */
    TimeMeasure time;
    time.start();

    /** główna pętla */
    while(time.getTime() <= stop) {
        int city1 = 0;
        int city2 = 0;
        int tmpCost = __INT_MAX__;
        for(auto i = 1; i < size; i++)
            for(auto j = 2; j < size; j++)
                if(i != j){
                    tmpSol = path;
                    pathTransition(tmpSol, i, j);
                    int newCost = calculatePathCost(tmpSol);
                    if(newCost < tmpCost && tabuList[i][j] == 0){
                        bestSol = tmpSol;
                        city1 = i;
                        city2 = j;
                        tmpCost = newCost;
                    }
                }
        if(city1 != 0){
            decreaseTabu();
            increaseTabu(city1, city2);
        }
        if(finalCost > tmpCost){
            finalCost = tmpCost;
            finalPath = bestSol;
            time.end();
            finalTime = time.getTime();
        }
        pathTransition(path, city1, city2);
        diversivication(tmpCost);

        /** zwiększ czas wykonania funkcji */
        time.end();
    }

}

void TabuAlgorithm::clear() {
    cost = 0;
    finalCost = __INT_MAX__;
    div = 0;
    maxDiv = size*2;
    clearTabuList();
    clearPath(path);
    randomShuffle(path);
}

void TabuAlgorithm::clearTabuList(){
    tabuList.clear();
    for(auto i = 0; i < size; i++)
        tabuList.push_back(std::vector<int>(size, 0));
}

void TabuAlgorithm::pathTransition(std::vector<int>& path, const int i, const int j) {
    if(proximity == Proximity::SWAP) swap(path, i, j);
    else if(proximity == Proximity::INSERT) insert(path, i, j);
    else if(proximity == Proximity::INVERT) invert(path, i, j);
}

void TabuAlgorithm::decreaseTabu() {
    /*
    for(auto row : tabuList)
        for(auto val : row)
            if (val > 0)
                val--;
                */
    for(auto i = 0; i < size; i++)
        for (auto j = 0; j < size; j++)
            if (tabuList[i][j] > 0)
                tabuList[i][j]--;
}

void TabuAlgorithm::increaseTabu(const int i, const int j) {
    tabuList[i][j] += size;
    tabuList[j][i] += size;
}

void TabuAlgorithm::diversivication(const int nCost) {
    
    finalCost <= nCost ? div++ : div = 0;

    if(div > maxDiv) { 
        std::vector<int> tmp;
        tmp = path;
        for(auto i = 0; i < size; i++){
            randomShuffle(tmp);
            auto pathCost = calculatePathCost(path);
            auto tmpCost = calculatePathCost(tmp);
            if(pathCost > tmpCost)
                path = tmp;
            if(finalCost > tmpCost)
                finalPath = path;
        }
        clearTabuList();
        div = 0;
    }
}