import std.stdio;

void main() {
	Point!double center; 	// a point in 3-dimensional space
	Point!(int, 2) point;	// a point in 2-dimensional surface
}

struct Point(T, size_t dimension = 3) {
	T[dimension] coordinates;
}
