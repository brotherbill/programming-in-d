import std.stdio;

void main()
{
	Point response = getResponse!(Point)("Where is the center?");
	writeln("response: ", response);
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
	int x;
	int y;
}
