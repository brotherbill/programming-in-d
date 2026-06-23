import std.stdio : writeln;

void main()
{   
	// /+
	int[] numbers = [5, 6, 7, 8, 9];
	writeln("numbers before: ", numbers);
	writeln("inner(numbers):    ", inner(numbers));
	writeln("numbers after : ", numbers);
	writeln;

	int[] middle = inner(numbers);
	middle[] *= 10;
	writeln("              middle:             ", middle);
	writeln("numbers after middle changed : ", numbers);
	writeln; 
	// +/

	// mutable_test;
	// immutable_test;
	// const_test;
}

inout(int)[] inner(inout(int)[] slice) pure
{
	if (slice.length)
	{
		--slice.length;
		if (slice.length)
		{
			slice = slice[1 .. $];
		}
	}
	return slice;
}

void mutable_test()
{
	int[] numbers = [5, 6, 7, 8, 9];

	// The return type is a slice of mutable elements
	int[] middle = inner(numbers);
	middle[] *= 10;
	writeln("mutable_test. middle:     ", middle);
	writeln("mutable_test. numbers: ", numbers);
}

void immutable_test()
{
	immutable int[] numbers = [10, 11, 12];

	// The return type is a slice of immutable elements
	immutable int[] middle = inner(numbers);
	// middle[] *= 10;						// won't compile
	writeln("immutable_test: ", middle);
	writeln("numbers:    ", numbers);
}

void const_test()
{
	const int[] numbers = [13, 14, 15, 16];

	// The return type is a slice of const elements
	const int[] middle = inner(numbers);
	// middle[] *= 10;							// won't compile
	writeln("const_test:     ", middle);
	writeln("numbers:    ", numbers);
}
