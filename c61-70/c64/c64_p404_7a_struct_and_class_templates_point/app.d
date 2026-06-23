import std.stdio;
import std.math;

void main()
{
	auto center = getResponse!Point("Where is the center?");
	auto branch = getResponse!Point("Where is the branch?");

	writeln("Distance: ", center.distanceTo(branch));
}

// The general definition of the function template (same as before)
T getResponse(T)(string question)
{
	writef("%s (%s): ", question, T.stringof);

	T response;
	readf(" %s", &response);

	return response;
}

// The specialization of the function template for Point
T getResponse(T : Point)(string question)
{
	writefln("%s (Point)", question);

	auto x = getResponse!int("  x");
	auto y = getResponse!int("  y");

	return Point(x, y);
}

struct Point
{
	int x; // in Kilometers
	int y; // in Kilometers

	int distanceTo(Point that) const
	{
		immutable real xDistance = x - that.x;
		immutable real yDistance = y - that.y;
		immutable distance = sqrt((xDistance * xDistance) + (yDistance * yDistance));

		return cast(int) distance;
	}
}
