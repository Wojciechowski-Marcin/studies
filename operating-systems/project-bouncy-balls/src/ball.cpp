#include "ball.hpp"
#include "ballManager.hpp"
#include "utils.hpp"
#include "window.hpp"
#include <math.h>
#include <mutex>
#include <ncurses.h>
#include <thread>

Ball::Ball(double y_position_start, double x_position_start,
           double move_interval, double starting_angle)
    : y_position_start_(y_position_start), x_position_start_(x_position_start),
      y_position_(y_position_start), x_position_(x_position_start),
      angle_(starting_angle), move_speed_(2), move_interval_(move_interval) {
  move_thread_ = std::thread([&]() { move(); });
}

void Ball::sleepBall_() {
  std::unique_lock<std::mutex> lock(BallManager::mtx);
  BallManager::sleep_count++;
  BallManager::cv.wait(lock, []() { return BallManager::balls_ready; });
  BallManager::sleep_count--;
  BallManager::cv.notify_all();
  lock.unlock();

  int random = utils::generateRandomNumber(1, 3);

  angle_ = (M_PI / 4) * random;
  move_speed_ = 2;
  time_ = 0;
}

void Ball::checkXCollision_(double x_new_position) {
  if (x_new_position >= Window::cols || x_new_position < 0) {
    x_position_start_ = x_position_;
    y_position_start_ = y_position_;

    angle_ = M_PI - angle_;
    time_ = 0;
  } else {
    x_position_ = x_new_position;
  }
}

void Ball::checkYCollision_(double y_new_position) {
  if (y_new_position >= Window::rows || y_new_position < 0) {
    if (y_new_position >= Window::rows) {
      double random = utils::generateRandomNumber(80, 90);
      move_speed_ *= random / 100;
    }
    time_ = 0;
    x_position_start_ = x_position_;
    y_position_start_ = y_position_;

    if (angle_ == M_PI) {
      angle_ = 3 * M_PI / 4;
    } else if (angle_ == 0) {
      angle_ = M_PI / 4;
    } else {
      angle_ = 2 * M_PI - angle_;
    }
  } else {
    y_position_ = y_new_position;
  }
}

void Ball::move() {
  while (Window::running_loop) {
    double x_new_position =
        x_position_start_ + move_speed_ * time_ * cos(angle_);
    double y_new_position = y_position_start_ -
                            move_speed_ * time_ * sin(angle_) +
                            0.1 * time_ * time_ / 2;

    if (move_speed_ < 0.5) {
      sleepBall_();
    }

    checkXCollision_(x_new_position);
    checkYCollision_(y_new_position);

    time_ += 1;
    std::this_thread::sleep_for(
        std::chrono::microseconds(static_cast<int>(move_interval_ * 100000)));
  }
}

void Ball::print() {
  mvprintw(static_cast<int>(y_position_), static_cast<int>(x_position_), "O");
}

void Ball::endThread() { move_thread_.join(); }