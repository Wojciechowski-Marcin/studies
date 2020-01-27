#include <chrono>
#include "TimeMeasure.h"

using Clock1 = std::chrono::high_resolution_clock;
using Duration = std::chrono::duration<double>;

void TimeMeasure::start() {
    t1 = Clock1::now();
}

void TimeMeasure::end() {
    t2 = Clock1::now();
}

double TimeMeasure::getTime() {
    if(std::chrono::duration_cast<Duration>(t2.time_since_epoch()).count() != 0){
        duration = std::chrono::duration_cast<Duration>(t2-t1);
    }
    else {
        duration = std::chrono::duration_cast<Duration>(Clock1::now()-t1);
    }
    return duration.count();
}