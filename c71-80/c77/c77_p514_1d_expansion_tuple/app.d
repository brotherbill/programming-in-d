import std.stdio;
import std.typecons;

void main()
{
	auto t = tuple(1, 2, 3);
	auto a = [t.expand, t[]];
	writeln(a);
}
