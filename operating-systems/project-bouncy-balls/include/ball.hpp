#pragma once

#include <thread>

class Ball {
public:
  Ball(double y_position_start, double x_position_start, double move_interval,
       double starting_angle);
  void move();
  void print();
  void endThread();

private:
  void sleepBall_();
  void checkXCollision_(double x_new_position);
  void checkYCollision_(double y_new_position);
  std::thread move_thread_;
  double y_position_start_ = 0;
  double x_position_start_ = 0;
  double y_position_ = 0;
  double x_position_ = 0;
  double angle_ = 0;
  double move_speed_ = 0;
  double move_interval_ = 0;
  double time_ = 0;
};