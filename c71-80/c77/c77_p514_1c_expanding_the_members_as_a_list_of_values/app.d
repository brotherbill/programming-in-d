import std.stdio;
import std.typecons;

void foo(int i, string s, double d, char c)
{
	writefln("foo  i: %s, s: %s, d: %s, c: %s", i, s, d, c);
}

void bar(int i, double d, char c)
{
	writefln("bar  i: %s, d: %s, c: %s", i, d, c);
}

void main()
{
	auto t = tuple(1, "2", 3.3, '4');

	// Both of the following lines are equivalents of foo(1, "2", 3.3, '4'):
	foo(t.expand);
	foo(t[]);

	// The equivalent of bar(1, 3.3, '4'):
	bar(t[0], t[$ - 2 .. $]);
}
