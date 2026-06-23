import std.stdio : writeln;

void main()
{
	int[] numbers;
	numbers ~= 10;
	// ... various other modifications ...
	numbers[0] = 42;

	calculate_const(numbers); 
	calculate_immutable(numbers); // ← compilation ERROR.  numbers argument must be immutable int[]
}

// coordinates will not be modified inside the function.  coordinates argument may be a mutable array when passed in
void calculate_const(const int[] coordinates)
{
	// ...
}

// Not only will coordinates parameter not be modified inside the function, but also coordinates itself must be immutable when passed in
void calculate_immutable(immutable int[] coordinates)
{
	// ...
}
