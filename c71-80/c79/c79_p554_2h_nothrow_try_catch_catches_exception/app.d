import std.stdio;

void main()
{
	int result = add(3, 4);
	assert(result == 7);
}

int add(int lhs, int rhs) nothrow
{
	int result;

	try
	{
		writeln("adding");
		result = lhs + rhs; // ← compiles
	}
	catch (Exception error)
	{ 
		// ignore errors
	}
	return result;
}
