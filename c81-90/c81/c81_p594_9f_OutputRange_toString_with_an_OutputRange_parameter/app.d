import std.stdio;
import std.range;

void main()
{
	auto s = S("Greetings, Earthling!");
	writeln(s);
}

struct S
{
	string s;

	void toString(O)(ref O o) const if (isOutputRange!(O, char))
	{
		put(o, s);
	}
}
