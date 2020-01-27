#include "window.hpp"
#include "constants.hpp"
#include "utils.hpp"
#include <ncurses.h>
#include <thread>

int Window::height = 0;
int Window::width = 0;
bool Window::running_loop = true;

Window::Window() {
  initscr();
  updateSize();
  noecho();
  curs_set(0);

  gm.init(height, width);

  scene_ = std::thread([&]() { renderScene_(); });
  wait_for_key_press_ = std::thread([&]() { waitForKeyPress_(); });
}

Window::~Window() {
  wait_for_key_press_.join();
  scene_.join();
  endwin();
}

void Window::updateSize() { getmaxyx(stdscr, height, width); }
void Window::clearWin() { clear(); }
void Window::updateWin() { refresh(); }

void Window::renderScene_() {
  while (running_loop) {
    clearWin();
    gm.draw();
    updateWin();
    std::this_thread::sleep_for(
        std::chrono::milliseconds(Constants::RENDER_REFRESH));
  }
}

void Window::waitForKeyPress_() {
  while (getch() == 13) {
    std::this_thread::sleep_for(
        std::chrono::milliseconds(Constants::QUIT_REFRESH));
  }
  running_loop = false;
}
