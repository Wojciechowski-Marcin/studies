#ifndef TIMEMEASURE_H
#define TIMEMEASURE_H

/**
 * Function: Measures time between two time points
 */

#include <chrono>

using Clock1 = std::chrono::high_resolution_clock;
using Duration = std::chrono::duration<double>;

class TimeMeasure {
public:
    void start();
    void end();
    double getTime();
    
private:
    Clock1::time_point t1;
    Clock1::time_point t2;
    Duration duration;
};

#endif