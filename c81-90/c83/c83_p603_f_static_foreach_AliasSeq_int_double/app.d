import std.stdio;
import std.meta;

static foreach (T; AliasSeq!(int, double))
{
	T twoTimes(T arg)
	{
		return arg * 2;
	}
}

void main()
{
	writefln("twoTimes(3): %s", twoTimes(3));
	writefln("twoTimes(3.14): %s", twoTimes(3.14));
}
