import std.stdio : writeln;

void main()
{
	int a = 100;
	int b = 20;

	print(a); 		// ← compiles
	print(a + b); 	// ← compilation ERROR
}

void print(ref const(int) value)
{
	writeln(value);
}
