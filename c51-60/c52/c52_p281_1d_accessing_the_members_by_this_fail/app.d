import std.stdio : writeln;

void main()
{
	auto test = Test('T');
	writeln("test: ", test);
}

struct Test
{
	char   c;
	int    i;
	double d;

	// At least one parameter must be non default
	this(in char   c, 
	     in int    i = int.init,
		 in double d = double.init)
	{
		// An attempt to assign an 'in' parameter to itself!
		c = c; 	// ← compilation ERROR
		i = i; 	// ← compilation ERROR
		d = d;	// ← compilation ERROR
	}
}
