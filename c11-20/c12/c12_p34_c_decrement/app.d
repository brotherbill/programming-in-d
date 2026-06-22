import std.stdio;

void main()
{
	writeln("minimum int value   : ", int.min);
	writeln("maximum int value   : ", int.max);

	int number = int.min;
	writeln("before the decrement: ", number);

	--number;
	writeln("after one decrements: ", number);

	number -= 1;
	writeln("after two decrements: ", number);
}
