#include <vector>
#include <random>
#include <algorithm>
#include "Algorithm.h"

std::vector<int> Algorithm::getFinalPath()
{
    return finalPath;
}

int Algorithm::getFinalCost()
{
    return finalCost;
}

double Algorithm::getFinalTime()
{
    return finalTime;
}

int Algorithm::calculatePathCost(const std::vector<int> &path)
{
    int cost = 0;
    for (auto it = path.begin(); it != path.end() - 1; it++)
        cost += cities[*it][*(it + 1)];
    cost += cities[*(path.end() - 1)][0];
    return cost;
}

void Algorithm::randomShuffle(std::vector<int> &path)
{
    std::random_device rd;
    std::mt19937 g(rd());
    std::shuffle(path.begin(), path.end(), g);
}

void Algorithm::clearPath(std::vector<int> &path)
{
    path.clear();
    for (auto i = 0; i < size; i++)
    {
        path.push_back(i);
    }
}

void Algorithm::swap(std::vector<int> &path, const int i, const int j)
{
    iter_swap(path.begin() + i, path.begin() + j);
}

void Algorithm::insert(std::vector<int> &path, const int i, const int j)
{
    auto tmp = path.at(j);
    path.erase(path.begin() + j);
    path.insert(path.begin() + i, tmp);
}

void Algorithm::invert(std::vector<int> &path, const int i, const int j)
{
    i < j ? std::reverse(path.begin() + i, path.begin() + j) : std::reverse(path.begin() + j, path.begin() + i);
}

void Algorithm::getRandomValues(int &r1, int &r2, int max)
{
    r1 = rand() % max;
    r2 = rand() % max;
    while (r1 == r2)
        r2 = rand() % max;
}