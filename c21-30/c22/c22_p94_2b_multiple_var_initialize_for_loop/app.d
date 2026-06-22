import std.stdio;

void main()
{
	// Use block scoping in for loop to declare multiple variables with different types
	for ({ int i = 0; double d = 0.5; }	i < 10; ++i, d /= 2)
	{
		writeln("i: ", i, ", d: ", d);
	}
}
