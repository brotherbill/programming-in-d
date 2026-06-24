import std.stdio;
import std.typecons;

void main()
{
	auto t = tuple(42, "hello", 1.5);

	foreach (i, member; t)
	{
		writefln("%s: %s", i, member);
	}
}
