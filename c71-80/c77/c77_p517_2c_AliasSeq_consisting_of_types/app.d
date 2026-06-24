import std.stdio;
import std.conv;

void main()
{
	auto s = S!(double, int)([1, 2, 3]);
	auto l = s.length();

	writeln("main s: ", s);
	writeln("main l: ", l);
	writeln;

	aliasSeqTester;
}

struct S(ElementT, ResultT)
{
	ElementT[] arr;

	ResultT length()
	{
		return to!ResultT(arr.length);
	}
}

void aliasSeqTester()
{
	import std.meta;

	alias Types = AliasSeq!(double, int);
	auto s = S!Types([1, 2, 3]);
	writeln("aliasSeqTester s: ", typeof(s).stringof);
	writeln("aliasSeqTester s: ", s);
}
