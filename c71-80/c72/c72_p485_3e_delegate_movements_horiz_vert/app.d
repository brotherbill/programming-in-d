import std.stdio;

void main()
{
	auto location = Location(3, 5);
	writeln(location);

	void delegate(long)[] movements =
		[
			&location.moveHorizontally,
			&location.moveVertically,
			&location.moveHorizontally
		];

	foreach (movement; movements)
	{
		movement(1);
	}

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
