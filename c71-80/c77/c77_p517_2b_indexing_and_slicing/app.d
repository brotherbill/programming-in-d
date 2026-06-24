import std.stdio;

void main()
{
	import std.meta;

	alias arguments = AliasSeq!(1, "hello", 2.5);

	writeln("arguments: ", typeof(arguments).stringof);

	assert(arguments[0] == 1);
	assert(arguments[1] == "hello");
	assert(arguments[2] == 2.5);

	bar(arguments[$ - 2 .. $]);
}

void bar(string s, double d)
{
	writefln("bar s: %s, d: %s", s, d);
}
