import std.stdio;

void main()
{
	auto calculator = makeCalculator();
	writeln("The result of the calculation: ", calculator(3));
}

alias Calculator = int delegate(int);

Calculator makeCalculator()
{
	int increment = 10;

	// value is hidden parameter of the delegate, in this case: 3
	return value => increment + value; // increment is captured on the heap, as delegate escapes
}
