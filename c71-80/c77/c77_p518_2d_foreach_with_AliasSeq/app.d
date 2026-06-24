import std.stdio;
import std.conv;

void main()
{
	aliasSeqEquivalentTester;
}

struct S(ElementT, ResultT)
{
	ElementT[] arr;

	ResultT length()
	{
		return to!ResultT(arr.length);
	}
}

void aliasSeqEquivalentTester()
{
	import std.meta;

	{
		auto s = S!(int, size_t)([int.init, int.init]);
		assert(s.length() == 2);
	}
	{
		auto s = S!(long, size_t)([long.init, long.init]);
		assert(s.length() == 2);
	}
	{
		auto s = S!(float, size_t)([float.init, float.init]);
		assert(s.length() == 2);
	}
}

unittest
{
	alias Types = AliasSeq!(int, long, float);

	foreach (Type; Types)
	{
		auto s = S!(Type, size_t)([Type.init, Type.init]);
		assert(s.length() == 2);
	}
}
