#pragma once

#include "village.hpp"
#include <vector>

class Tribe {
public:
  Tribe(int maxX, int maxY, int color);
  std::vector<std::shared_ptr<Village>> villages;
  void draw();
  int color;

private:
};