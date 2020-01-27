#ifndef PROXIMITY_H
#define PROXIMITY_H

/**
 * Function: defines the vertex proximity method
 */

#include <string>

namespace Proximity{
	enum Proximity {
		SWAP,
		INSERT,
		INVERT,
	};
	std::string ToString(Proximity proximity);
}
#endif