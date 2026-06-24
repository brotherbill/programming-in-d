import std.stdio;

void main()
{
	auto centagon = Polygon!100();
}

struct Point
{
	double x;
	double y;
}

struct Polygon(size_t N)
{
	Point[N] corners;
}

struct Triangle
{
	Point[3] corners;
	// ...
}

struct Rectangle
{
	Point[4] corners;
	// ...
}

struct Pentagon
{
	Point[5] corners;
	// ...
}
