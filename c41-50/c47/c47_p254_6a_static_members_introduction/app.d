import std.stdio : writeln;

size_t lastId;

void main()
{
	auto pt1 = makePoint(10, 15);
	auto pt2 = makePoint(20, 25);

	writeln("pt1: ", pt1);
	writeln("pt2: ", pt2);
}

struct Point
{
	// The identifier of each object
	size_t id;
	int    line;
	int    column;
}

Point makePoint(int line, int column)
{
	size_t id = ++lastId;
	return Point(id, line, column);
}
