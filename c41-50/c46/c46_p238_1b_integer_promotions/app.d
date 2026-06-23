import std.stdio : writeln;

void main()
{
	ubyte a = 1;
	ubyte b = 2;

	writeln(typeof(a + b).stringof); // the addition is not in ubyte, but in int.

	// ubyte c = a + b; // This will cause a compilation error: cannot implicitly convert expression of type 'int' to 'ubyte'

	// To fix the error, we need to explicitly cast the result back to ubyte
	ubyte d = cast(ubyte)(a + b);

	writeln("d = ", d); // d = 3
}
