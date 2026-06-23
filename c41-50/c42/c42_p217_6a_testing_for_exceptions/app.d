import std.stdio : writeln;
import std.exception : enforce, assertThrown, assertNotThrown;

void main()
{
	// This runs to completion
	auto result = average([], []);

	// This throws an exception
	result = average([1], [1, 2]);
}

int[] average(int[] a, int[] b)
{
	assert( a.length == b.length, "assert:  Input slices must have the same length");	
	// enforce( a.length == b.length, "enforce: Input slices must have the same length");  

	// Implementation goes here
	return cast(int[])[]; // Initial result, so it compiles
}

unittest
{
	/* Must throw for uneven slices */
	assertThrown(average([1], [1, 2]));

	/* Must not throw for empty slices */
	assertNotThrown(average([], []));
}
