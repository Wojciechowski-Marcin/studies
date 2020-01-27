#pragma once

#include <condition_variable>
#include <memory>
#include <mutex>
#include <thread>

class Village;

class Army {
public:
  Army(Village *base, int strength);
  ~Army();
  int positionY;
  int positionX;
  Village *base;
  int strength = 0;
  bool isAttacking = false;
  bool didAttack = false;
  std::shared_ptr<Village> target;
  void draw();
  void pickTarget();
  void move();
  void attack();
  void reset(int strength);
  std::condition_variable cvAttack;
  std::thread move_;

private:
  std::mutex m;
};