#pragma once

#include "gameManager.hpp"
#include <thread>

class Window {
public:
  Window();
  ~Window();
  static int height;
  static int width;
  static bool running_loop;
  static void updateSize();
  static void clearWin();
  static void updateWin();

private:
  GameManager gm;
  void waitForKeyPress_();
  void renderScene_();
  std::thread scene_;
  std::thread wait_for_key_press_;
};