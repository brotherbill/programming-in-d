import std.stdio;

void main()
{
	writeln("minimum int value   : ", int.min);
	writeln("maximum int value   : ", int.max);

	int number = int.max;
	writeln("before the increment: ", number);

	++number;
	writeln("after  the increment: ", number);
}
