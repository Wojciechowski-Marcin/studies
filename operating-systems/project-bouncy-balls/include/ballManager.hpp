#pragma once

#include "ball.hpp"
#include <condition_variable>
#include <memory>
#include <mutex>
#include <thread>
#include <vector>

class BallManager {
public:
  BallManager();
  ~BallManager();
  static int sleep_count;
  static bool balls_ready;
  static std::mutex mtx;
  static std::condition_variable cv;
  void renderScene();

private:
  std::vector<std::unique_ptr<Ball>> balls_;
  void checkSleeping_();
  void createBall_();
  void terminateBallThreads_();
  std::thread create_balls_;
  std::thread check_sleeping_;
};