#include "village.hpp"
#include "constants.hpp"
#include "gameManager.hpp"
#include "utils.hpp"
#include "window.hpp"
#include "worker.hpp"
#include <memory>
#include <ncurses.h>

Village::Village(int y, int x, int color)
    : positionY(y), positionX(x), color(color) {
  for (int i = 0; i < Constants::WORKER_NUMBER; i++) {
    workers.push_back(std::make_unique<Worker>(positionY, positionX, this));
  }
  army = std::make_unique<Army>(this, 0);

  armyStrengthAppender_ = std::thread([&]() { appendStrength(); });
}

Village::~Village() { armyStrengthAppender_.join(); }

void Village::createArmy(int strength) { army->reset(strength); }

void Village::draw() {
  start_color();
  init_pair(color, COLOR_BLACK, color);
  attron(COLOR_PAIR(color));
  for (int i = -1; i <= 1; i++) {
    for (int j = -2; j <= 2; j++) {
      if (i == -1 && j == 0)
        mvprintw(positionY + i, positionX + j, "V");
      else if (i == 0 && j == 2)
        mvprintw(positionY + i, positionX + j, "M");
      else if (i == 1 && j == 2)
        mvprintw(positionY + i, positionX + j,
                 std::to_string(materialAmount).c_str());
      else
        mvprintw(positionY + i, positionX + j, " ");
    }
  }
  attroff(COLOR_PAIR(color));
  for (auto &worker : workers) {
    worker->draw();
  }
  army->draw();
}

void Village::appendStrength() {
  while (Window::running_loop) {
    if (!army->isAttacking) {
      if (materialAmount >= 3) {
        int randChance = utils::generateRandomNumber(0, 100);
        int randStrength = Constants::ARMY_ATTACK_DEBUG
                               ? utils::generateRandomNumber(10, 30)
                               : utils::generateRandomNumber(1, 3);
        if (randChance <= Constants::ARMY_GENERATION_CHANCE) {
          army->strength += randStrength;
          materialAmount -= 3;
          if (army->strength >= 10 && !isBeingAttacked &&
              !GameManager::isGameOver)
            army->cvAttack.notify_one();
        }
      }
    }
    std::this_thread::sleep_for(
        std::chrono::milliseconds(Constants::ARMY_GENERATION_SPEED));
  }
}