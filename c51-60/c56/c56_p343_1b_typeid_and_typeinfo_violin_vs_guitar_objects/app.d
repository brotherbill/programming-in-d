import std.stdio;

void main()
{
	auto v1 = new Violin;
	auto v2 = new Violin;
	auto g  = new Guitar;

	foo("v1, v2", v1, v2);
	foo("v1, g ", v1, g);
}

void foo(string info, MusicalInstrument m, StringInstrument s)
{
	const isSame = (typeid(m) == typeid(s));

	writefln("%s: The types of the arguments are %s.", info, (isSame ? "the same" : "different"));
}

class MusicalInstrument
{
}

class StringInstrument : MusicalInstrument
{
}

class Violin : StringInstrument
{
}

class Guitar : StringInstrument
{
}
