import std.stdio;

void main()
{
	double value = 1.5;
	addHalf(value);
	writeln("The value after calling the function: ", value);
}

void addHalf(double value)
{
	value += 0.5; // ← Does not affect 'value' in main
}
