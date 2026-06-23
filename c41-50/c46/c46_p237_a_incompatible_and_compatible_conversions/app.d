import std.stdio : writeln;

void main()
{
	// Incompatible types example
	// /+
	char[] slice;
	writeln(slice + 5);		// ← compilation ERROR, incompatible types
	// +/

	// Example code demonstrating type compatibility in D
	double sum       = 1.25;
	int    increment = 3;
	sum += increment;
	writeln("new sum: ", sum);
}
