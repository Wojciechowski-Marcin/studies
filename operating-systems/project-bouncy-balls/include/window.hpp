#pragma once

#include "ballManager.hpp"
#include <thread>

class Window {
public:
  Window();
  ~Window();
  BallManager bm;
  static int rows;
  static int cols;
  static bool running_loop;
  static void updateSize();
  static void clearWin();
  static void updateWin();

private:
  void waitForKeyPress_();
  void renderScene_();
  std::thread scene_;
  std::thread wait_for_key_press_;
};