#include "army.hpp"
#include "constants.hpp"
#include "gameManager.hpp"
#include "utils.hpp"
#include "window.hpp"
#include <algorithm>
#include <ncurses.h>

Army::Army(Village *base, int strength)
    : positionY(base->positionY), positionX(base->positionX - 2), base(base),
      strength(strength) {
  move_ = std::thread([&]() { move(); });
}

Army::~Army() {
  // delete base;
  strength = 10;
  didAttack = true;
  cvAttack.notify_one();
  move_.join();
}

void Army::draw() {
  start_color();
  attron(COLOR_PAIR(base->color));
  mvprintw(positionY, positionX, "A");
  mvprintw(positionY + 1, positionX, std::to_string(strength).c_str());
  attroff(COLOR_PAIR(base->color));
}

void Army::pickTarget() {
  do {
    int randomTribeIndex = 0;
    do {
      randomTribeIndex =
          utils::generateRandomNumber(0, GameManager::tribes.size() - 1);
    } while (GameManager::tribes[randomTribeIndex]->color == base->color);
    int randomVillageIndex = utils::generateRandomNumber(
        0, GameManager::tribes[randomTribeIndex]->villages.size() - 1);
    target =
        GameManager::tribes[randomTribeIndex]->villages[randomVillageIndex];
  } while (target->isBeingAttacked);
}

void Army::move() {
  while (Window::running_loop && !didAttack) {
    if (strength < 10) {
      std::unique_lock<std::mutex> lk(m);
      cvAttack.wait(lk, [&] { return strength >= 10; });
      isAttacking = true;
      target->isBeingAttacked = true;
    }
    if (positionX > target->positionX + 1)
      positionX--;
    else if (positionX < target->positionX - 1)
      positionX++;
    else if (positionY > target->positionY + 1)
      positionY--;
    else if (positionY < target->positionY - 1)
      positionY++;
    else
      attack();
    std::this_thread::sleep_for(
        std::chrono::milliseconds(Constants::ARMY_SPEED));
  }
}

void Army::reset(int strength) {
  positionY = base->positionY;
  positionX = base->positionX - 2;
  this->strength = strength;
  isAttacking = false;
}

void Army::attack() {
  target->isBeingAttacked = false;

  // if this army strength is higher (battle won)
  if (target->army->strength < strength) {

    // reduce this army strength
    strength -= target->army->strength;

    // recreate armies
    target->createArmy(strength);

    // find base tribe and target tribe
    std::shared_ptr<Tribe> targetTribe;
    std::shared_ptr<Tribe> baseTribe;
    for (auto &tribe : GameManager::tribes) {
      if (tribe->color == target->color)
        targetTribe = tribe;
      if (tribe->color == base->color)
        baseTribe = tribe;
    }

    // erase village from the enemy
    targetTribe->villages.erase(std::remove(targetTribe->villages.begin(),
                                            targetTribe->villages.end(),
                                            target),
                                targetTribe->villages.end());

    // add village to our base
    baseTribe->villages.push_back(target);
    if (baseTribe->villages.size() == 4)
      GameManager::isGameOver = true;

    // change target color
    target->color = base->color;
  }
  // if battle lost
  else {
    target->army->strength -= strength;
  }
  reset(0);
  if (!GameManager::isGameOver)
    pickTarget();
}