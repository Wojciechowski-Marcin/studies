#ifndef ALGORITHM_H
#define ALGORITHM_H

/**
 * Function: Virtual class, algorithms derive from it
 */

#include <vector>
#include <chrono>
#include "AtspFile.h"

class Algorithm : public AtspFile
{
public:
  virtual void compute() = 0;
  std::vector<int> getFinalPath();
  int getFinalCost();
  double getFinalTime();

protected:
  double stop;
  std::vector<int> finalPath;
  int finalCost;
  double finalTime;
  int calculatePathCost(const std::vector<int> &path);
  void randomShuffle(std::vector<int> &path);
  void clearPath(std::vector<int> &path);
  void swap(std::vector<int> &path, const int i, const int j);
  void insert(std::vector<int> &path, const int i, const int j);
  void invert(std::vector<int> &path, const int i, const int j);
  void getRandomValues(int &r1, int &r2, int max);
};

#endif