#pragma once

#include "material.hpp"
#include <condition_variable>
#include <mutex>
#include <thread>

class Village;

class Worker {
public:
  Worker(int y, int x, Village *base);
  ~Worker();
  int positionY;
  int positionX;
  Village *base;
  std::shared_ptr<Material> closestMaterial;
  bool hasMaterial;
  void move();
  void draw();
  void drop();
  void dig();

private:
  std::condition_variable cvDig;
  std::mutex m;
  std::thread move_;
  std::thread dig_;
};