import std.stdio;

void main()
{
	uint number_1 = 10;
	uint number_2 = 20;

	writeln("PROBLEM! uint cannot have negative values:");
	writeln("10 - 20: ", number_1 - number_2);
	writeln("20 - 10: ", number_2 - number_1);
}
