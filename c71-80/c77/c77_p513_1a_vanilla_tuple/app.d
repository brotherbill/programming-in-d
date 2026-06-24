import std.stdio;
import std.typecons;

void main()
{
	auto t = tuple(42, "hello");
	writeln(t);
	writeln("t[0]: ", t[0]);
	writeln("t[1]: ", t[1]);
}
