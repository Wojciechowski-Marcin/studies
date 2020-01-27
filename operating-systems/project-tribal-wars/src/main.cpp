#include "utils.hpp"
#include "window.hpp"
#include <iostream>

int main() {
  srand(time(NULL));
  Window window;
  while (!Window::running_loop) {
    return 0;
  }
}