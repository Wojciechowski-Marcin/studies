#include <random>
#include <thread>

namespace utils {
  int generateRandomNumber(int startRange, int endRange) {
    if (startRange >= endRange) {
      return startRange;
    }

    std::random_device rd;
    std::mt19937 mt(rd());
    std::uniform_int_distribution<int> dist(startRange, endRange);
    return dist(mt);
  }
} // namespace utils