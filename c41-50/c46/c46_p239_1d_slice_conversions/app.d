import std.stdio : writeln;

void main()
{
	foo();
}

void foo()
{
	int[2] array = [1, 2];	// Fixed-length array
	bar_slice(array); 		// Passes fixed-length array as a slice
	bar_fixed(array);		// Passes fixed-length array as is
	writeln(__LINE__, " array after bar_fixed: ", array); // Outputs: [1, 7]
}

void bar_slice(int[] slice)	// Accepts a dynamic array (slice)
{
	slice[1] = 7;			// Modify the second element, which affects the original array
	writeln(__LINE__, " slice                : ", slice);				// Outputs: [1, 7]
}

void bar_fixed(int[2] fixed_size_array)	// Copy of fixed-length array (not a slice)
{
	fixed_size_array[0] = 9;			// Modify the first element	
	writeln(__LINE__, " fixed_size_array     : ", fixed_size_array);	// Outputs: [9, 7]
}
