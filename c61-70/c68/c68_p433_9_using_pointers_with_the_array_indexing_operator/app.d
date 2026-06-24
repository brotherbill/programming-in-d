import std.stdio;
import core.exception;

void main()
{
	ptrIndexingExample;
	writeln;

	sliceIndexingExample;
	writeln;

	outOfBoundsExample;
}

void ptrIndexingExample()
{
	double[] floats = [0.0, 1.1, 2.2, 3.3, 4.4];

	double* ptr = &floats[2];

	writeln("floats before pointer modifications: ", floats);

	*ptr = -100.0; // direct access to what it points to
	ptr[1] = -200.0; // indexing from the pointer
	writeln("floats after pointer modifications: ", floats);

	*(ptr + 1) = -300.0; // pointer arithmetic
	writeln("floats after second pointer arithmetic modification: ", floats);
}

void sliceIndexingExample()
{
	double[] floats = [0.0, 1.1, 2.2, 3.3, 4.4];

	auto slice = floats[2 .. 4]; // slice starting from index 2 to index 4 (exclusive)

	writeln("floats before slice modifications: ", floats);

	slice[0] = -100.0; // modifies floats[2]
	slice[1] = -200.0; // modifies floats[3]
	writeln("floats after slice modifications: ", floats);

	slice[1] = -300.0; // modifies floats[3] again
	writeln("floats after second slice modification: ", floats);
}

void outOfBoundsExample()
{
	double[] floats = [0.0, 1.1, 2.2, 3.3, 4.4];

	writeln("Attempting out-of-bounds access...");

	try
	{
		auto slice = floats[2 .. 4]; // valid slice
		writeln("Valid slice: ", slice);

		// This will throw an exception because we are accessing out of bounds
		slice[2] = -300.0; // slice has length 2, valid indices are 0 and 1
	}
	catch (RangeError e)
	{
		writeln("Caught RangeError: ", e.msg);
	}
	writeln;

	try
	{
		double* ptr = &floats[2];
		writeln("Pointer pointing to floats[2]: ", *ptr);

		// This will likely lead to undefined behavior, but in D it may throw an error
		ptr[3] = -400.0; // Accessing out of bounds (valid indices are 0, 1, and 2)
		writeln("After out-of-bounds pointer access, floats: ", floats, ", ptr[3]: ", ptr[3]);
	}
	catch (RangeError e)
	{
		writeln("Caught RangeError when accessing via pointer: ", e.msg);
	}

	writeln("Final state of floats array: ", floats);
}
