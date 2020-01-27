#include <vector>
#include <string>
#include "AtspFile.h"

/** ctor */
AtspFile::AtspFile(const Vector2D& cities_, const int size_, const int optimal_) 
    : cities(cities_), size(size_), optimal(optimal_) {}

/** getters */
Vector2D AtspFile::getCities(){ return cities; }
int AtspFile::getSize(){ return size; }
int AtspFile::getOptimal(){ return optimal; }