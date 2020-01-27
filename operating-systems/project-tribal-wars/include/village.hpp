#pragma once

#include "army.hpp"
#include "worker.hpp"
#include <memory>
#include <thread>
#include <vector>

class Village {
public:
  Village(int y, int x, int color);
  ~Village();
  std::vector<std::unique_ptr<Worker>> workers;
  std::unique_ptr<Army> army;
  void draw();
  int materialAmount = 0;
  int positionY;
  int positionX;
  int color;
  bool isBeingAttacked = false;
  void createArmy(int strength);
  void appendStrength();

private:
  std::thread armyStrengthAppender_;
};