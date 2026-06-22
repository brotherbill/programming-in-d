import std.stdio : writeln, writefln;

void main()
{
	writeln("heads is 0: ", (HeadsOrTails.heads == 0));
	writeln("tails is 1: ", (HeadsOrTails.tails == 1));
	writeln;

	writefln("%d %d %d", Test.b, Test.c2, Test.g2);
	writeln;

	writeln("pi: ",      NaturalConstant.pi, ", ", cast(int)    NaturalConstant.pi);
	writeln("Celcius: ", TemperatureUnit.C,  ", ", cast(string) TemperatureUnit.C);
}

enum HeadsOrTails : bool
{
	heads,
	tails,
}

enum Test
{
	a,
	b,
	c,
	c2 = 100,
	d,
	e,
	f  = 222,
	g,
	g2
}

enum NaturalConstant : double
{
	pi = 3.14,
	e  = 2.72
}

enum TemperatureUnit : string
{
	C = "Celsius",
	F = "Fahrenheit"
}
