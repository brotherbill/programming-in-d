import std.stdio : writeln, writefln;

void main()
{
	writeln("Excludes tail content for last item by default.");
	auto numbers = [1, 2, 3, 4];

	writefln("Typical array formatting with comma and space between items:");
 	writefln("[%(%s, %)]", numbers);
}
