import std.stdio;

void main()
{
	writeln("MAIN");
	foo(1, "hello", 2.5);
	aliasTester;
	aliasSliceTester;
}

void foo(int i, string s, double d)
{
	writefln("foo is called with %s, %s, and %s.", i, s, d);
}

void aliasTester()
{
	import std.meta;

	alias arguments = AliasSeq!(1, "hello", 2.5);
	writeln("\nALIAS TESTER");
	writeln("arguments: ", typeof(arguments).stringof);
	foo(arguments);
}

void aliasSliceTester()
{
	import std.meta;

	alias elements = AliasSeq!(1, 2, 3, 4);
	writeln("aliasSliceTester elements: ", typeof(elements).stringof);

	auto arr = [elements];
	writeln("aliasSliceTester arr: ", typeof(arr).stringof);

	assert(arr == [1, 2, 3, 4]);
}
