import std.stdio;
import std.math;

void main()
{
	intPointDistance;
	doublePointDistance;
}

void intPointDistance()
{
	auto center = Point!int(0, 0);
	auto branch = Point!int(100, 100);

	writeln("Distance (int)   : ", center.distanceTo(branch));
}

void doublePointDistance()
{
	auto center = Point!double(1.2, 3.4);
	auto branch = Point!double(5.6, 7.8);

	writeln("Distance (double): ", center.distanceTo(branch));
}

struct Point(T)
{
	T x; // in Kilometers
	T y; // in Kilometers

	T distanceTo(Point that) const
	{
		immutable real xDistance = x - that.x;
		immutable real yDistance = y - that.y;

		immutable distance = sqrt((xDistance * xDistance) + (yDistance * yDistance));

		return cast(T) distance;
	}
}

T getResponse(T : Point)(string question)	// ←  compilation ERROR
{ 
	writefln("%s (Point)", question);

	auto x = getResponse!int("  x");
	auto y = getResponse!int("  y");

	return Point(x, y);
}
