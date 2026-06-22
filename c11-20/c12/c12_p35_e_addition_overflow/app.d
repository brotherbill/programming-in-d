import std.stdio;

void main()
{
	// 3 billion each
	uint number_1 = 3_000_000_000;
	uint number_2 = 3_000_000_000;

	writeln("maximum value of uint: ", uint.max);
	writeln("             number_1: ", number_1);
	writeln("             number_2: ", number_2);

	writeln("                  sum: ", number_1 + number_2);
	writeln("OVERFLOW! The result is not 6 billion!");
}
