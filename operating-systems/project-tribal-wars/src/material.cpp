#include "material.hpp"
#include <ncurses.h>

#define MATERIAL_COLOR 98

void Material::draw() {
  start_color();
  init_pair(MATERIAL_COLOR, COLOR_BLACK, COLOR_CYAN);
  attron(COLOR_PAIR(MATERIAL_COLOR));
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      mvprintw(positionY + i, positionX + j, " ");
      if (i == 0 && j == 0)
        mvprintw(positionY, positionX, "R");
    }
  }
  attroff(COLOR_PAIR(MATERIAL_COLOR));

  if (isBeingDigged) {
    init_pair(diggerColor + 4, diggerColor, COLOR_BLACK);
    attron(COLOR_PAIR(diggerColor + 4));
    if (diggingProgress > 0)
      mvprintw(positionY - 2, positionX - 1, "-");
    if (diggingProgress > 1)
      mvprintw(positionY - 2, positionX, "-");
    if (diggingProgress > 2)
      mvprintw(positionY - 2, positionX + 1, "-");
    attroff(COLOR_PAIR(diggerColor + 4));
  }
}
