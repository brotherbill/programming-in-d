import std.stdio;

void main()
{
	int a = 10;   // explicit typing
	writeln("1. a = ", a);

	auto b = 20;  // implicit typing
	writeln("2. b = ", b);

	a = b;
	writeln("3. a = ", a, ", b = ", b);
}
