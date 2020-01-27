#ifndef ATSPFILE_H
#define ATSPFILE_H

/**
 * Function: Store data read from .atsp file
 */

#include <vector>

using Vector2D = std::vector<std::vector<int>>;

class AtspFile {
public:
    AtspFile(const Vector2D& cities_, const int size_, const int optimal_);
    AtspFile() = default;
    Vector2D getCities();
    int getSize();
    int getOptimal();
protected:
    Vector2D cities;
    int size;
    int optimal;
};
#endif