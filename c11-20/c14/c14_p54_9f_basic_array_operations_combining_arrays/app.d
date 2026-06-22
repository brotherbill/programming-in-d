import std.stdio : writeln;

void main()
{
	writeln("Combining arrays");
	int[10] first  = 1;	// Fixed-length array initialized with 1 to all elements
	int[5]  second = 2; // Fixed-length array initialized with 2 to all elements

	// Concatenating fixed-length arrays.  
	// All types must match.
	// length must exactly match first.length + second.length.
	int[15] combinedFixed = first ~ second; 

	writeln(__LINE__, " first  fixed array  : ", first);
	writeln(__LINE__, " second fixed array  : ", second);
	writeln(__LINE__, " combinedFixed array : ", combinedFixed, " Length: ", combinedFixed.length, " Capacity: ", combinedFixed.capacity);

	int[] result = first ~ second; // Concatenating fixed-length arrays into a dynamic array
	writeln(__LINE__, " result dynamic array: ", result, " Length: ", result.length, " Capacity: ", result.capacity);
}
