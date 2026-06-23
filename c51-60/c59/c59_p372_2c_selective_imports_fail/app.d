import std.stdio : writeln;

void main()
{
	string name = "Brother Bill";

	writefln("Greetings %s.", name); // ← compilation ERROR, because writefln is not imported
}
