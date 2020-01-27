#include "Proximity.h"

/** converts enum to string */
std::string Proximity::ToString(Proximity proximity)
{
	switch (proximity)
	{
	case SWAP:
		return "SWAP";
	case INSERT:
		return "INSERT";
	case INVERT:
		return "INVERT";
	default:
		return "NotFound";
	}
}