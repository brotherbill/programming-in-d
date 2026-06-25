import std.stdio  : writeln, writefln;
import std.meta   : AliasSeq;
import std.traits : classInstanceAlignment;

void main()
{
	alias Types = AliasSeq!(char, short, int, long, double, real,
		string, int[int], int*,
		EmptyStruct, Struct, EmptyClass, Class);

	writeln(" Size  Alignment  Type\n", "=========================");

	foreach (Type; Types)
	{
		static if (is(Type == class))
		{
			size_t size = __traits(classInstanceSize, Type);
			size_t alignment = classInstanceAlignment!Type;
		}
		else
		{
			size_t size = Type.sizeof;
			size_t alignment = Type.alignof;
		}

		writefln("%4s%8s      %s", size, alignment, Type.stringof);
	}
}

struct EmptyStruct
{
}

struct Struct
{
	char   c;
	double d;
}

class EmptyClass
{
}

class Class
{
	char c;
}
