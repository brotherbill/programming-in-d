import std.stdio : writeln;

void main()
{
	auto top    = makePoint(7, 0);
	auto middle = makePoint(8, 0);
	auto bottom = makePoint(9, 0);

	writeln(" ", __LINE__, " top.id   : ", top.id);
	writeln(__LINE__, " middle.id: ", middle.id);
	writeln(__LINE__, " bottom.id: ", bottom.id);
}

struct Point
{
	// The identifier of each object
	size_t id;
	int    line;
	int    column;

	// The id of the last object constructed
	static size_t lastId;
}

Point makePoint(int line, int column)
{
	size_t id = ++Point.lastId;

	return Point(id, line, column);
}
