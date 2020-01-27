#include "worker.hpp"
#include "constants.hpp"
#include "village.hpp"
#include "window.hpp"
#include <ncurses.h>

Worker::Worker(int y, int x, Village *base)
    : positionY(y), positionX(x), base(base) {
  // closestMaterial = GameManager::findClosestMaterial(positionY, positionX);
  closestMaterial = GameManager::getRandomMaterial();
  hasMaterial = false;
  move_ = std::thread([&]() { move(); });
}

Worker::~Worker() {
  // delete base;
  hasMaterial = true;
  cvDig.notify_one();
  move_.join();
}

void Worker::draw() {
  start_color();
  attron(COLOR_PAIR(base->color));
  mvprintw(positionY, positionX, "W");
  attroff(COLOR_PAIR(base->color));
}

void Worker::move() {
  while (Window::running_loop) {
    if (hasMaterial) {
      if (positionX > base->positionX + 1)
        positionX--;
      else if (positionX < base->positionX - 1)
        positionX++;
      else if (positionY > base->positionY + 1)
        positionY--;
      else if (positionY < base->positionY - 1)
        positionY++;
      else
        drop();
    } else {
      if (positionX > closestMaterial->positionX + 1)
        positionX--;
      else if (positionX < closestMaterial->positionX - 1)
        positionX++;
      else if (positionY > closestMaterial->positionY + 1)
        positionY--;
      else if (positionY < closestMaterial->positionY - 1)
        positionY++;
      else if (!closestMaterial->isBeingDigged) {
        closestMaterial->isBeingDigged = true;
        closestMaterial->diggerColor = base->color;
        dig_ = std::thread([&]() { dig(); });
        std::unique_lock<std::mutex> lk(m);
        cvDig.wait(lk, [&] { return hasMaterial; });
        dig_.join();
      }
    }
    std::this_thread::sleep_for(
        std::chrono::milliseconds(Constants::WORKERS_SPEED));
  }
}

void Worker::drop() {
  hasMaterial = false;
  base->materialAmount++;
}

void Worker::dig() {
  while (Window::running_loop && !hasMaterial) {
    if (closestMaterial->diggingProgress < 3) {
      closestMaterial->diggingProgress++;
    } else {
      closestMaterial->diggingProgress = 0;
      closestMaterial->isBeingDigged = false;
      hasMaterial = true;
      cvDig.notify_one();
    }
    std::this_thread::sleep_for(
        std::chrono::milliseconds(Constants::DIGGING_SPEED));
  }
}