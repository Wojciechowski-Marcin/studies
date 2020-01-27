#include "tribe.hpp"
#include <memory>
#include <ncurses.h>

Tribe::Tribe(int y, int x, int color) : color(color) {
  villages.push_back(std::make_shared<Village>(y, x, color));
}

void Tribe::draw() {
  for (auto &village : villages) {
    village->draw();
  }
}