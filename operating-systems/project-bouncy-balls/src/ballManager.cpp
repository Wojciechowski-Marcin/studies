#include "ballManager.hpp"
#include "utils.hpp"
#include "window.hpp"
#include <math.h>
#include <memory>
#include <thread>

int BallManager::sleep_count = 0;
bool BallManager::balls_ready = false;
std::mutex BallManager::mtx;
std::condition_variable BallManager::cv;

BallManager::BallManager() {
  create_balls_ = std::thread([&]() { createBall_(); });
  check_sleeping_ = std::thread([&]() { checkSleeping_(); });
}
BallManager::~BallManager() {
  cv.notify_all();
  create_balls_.join();
  check_sleeping_.join();
  terminateBallThreads_();
}

void BallManager::checkSleeping_() {
  while (Window::running_loop) {
    if (sleep_count > 3) {
      balls_ready = true;
      while (sleep_count > 0)
        cv.notify_one();
      balls_ready = false;
    }
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
  }
}

void BallManager::createBall_() {
  while (Window::running_loop) {
    Window::updateSize();
    int random = utils::generateRandomNumber(0, 4);
    int random2 = utils::generateRandomNumber(50, 150);
    balls_.push_back(std::make_unique<Ball>(Window::rows / 2, Window::cols / 2,
                                            static_cast<double>(random2) / 100,
                                            (M_PI / 4) * random));
    std::this_thread::sleep_for(std::chrono::milliseconds(5000));
  }
}

void BallManager::renderScene() {
  while (Window::running_loop) {
    Window::clearWin();
    for (unsigned int i = 0; i < balls_.size(); ++i) {
      balls_[i]->print();
    }
    Window::updateWin();
    std::this_thread::sleep_for(std::chrono::milliseconds(50));
  }
}

void BallManager::terminateBallThreads_() {
  for (unsigned int i = 0; i < balls_.size(); ++i) {
    cv.notify_all();
    balls_[i]->endThread();
  }
}