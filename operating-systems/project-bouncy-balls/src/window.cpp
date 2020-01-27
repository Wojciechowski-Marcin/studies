#include "window.hpp"
#include <ncurses.h>
#include <thread>

int Window::rows = 0;
int Window::cols = 0;
bool Window::running_loop = true;

Window::Window() {
  initscr();
  updateSize();
  noecho();
  curs_set(0);
  scene_ = std::thread([&]() { renderScene_(); });
  wait_for_key_press_ = std::thread([&]() { waitForKeyPress_(); });
}

Window::~Window() {
  wait_for_key_press_.join();
  scene_.join();
  endwin();
}

void Window::updateSize() { getmaxyx(stdscr, rows, cols); }
void Window::clearWin() { clear(); }
void Window::updateWin() { refresh(); }
void Window::renderScene_() { bm.renderScene(); }

void Window::waitForKeyPress_() {
  while (getch() == 13) {
    std::this_thread::sleep_for(std::chrono::milliseconds(20));
  }
  running_loop = false;
}
