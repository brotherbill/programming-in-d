import std.stdio;

void main()
{
	auto location = Location(3, 5);
	writeln(location);
	writeln(typeof(&location.moveHorizontally).stringof);

	// The definition of the delegate variable:
	auto directionFunction = &location.moveHorizontally;
	writeln(typeof(directionFunction).stringof);

	// Calling the delegate by the function call syntax:
	directionFunction(100);

	writeln(location);
}

struct Location
{
	long x;
	long y;

	void moveHorizontally(long step)
	{
		x += step;
	}

	void moveVertically(long step)
	{
		y += step;
	}
}
