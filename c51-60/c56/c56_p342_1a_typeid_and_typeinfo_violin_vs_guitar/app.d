import std.stdio : writeln;

void main()
{
	TypeInfo v = typeid(Violin);
	auto     g = typeid(Guitar);
	writeln("typeof(g): ", typeof(g).stringof);

	assert(v != g); // ← the two types are not the same

	writeln(v);
	writeln(g);
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
