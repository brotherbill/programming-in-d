import std.stdio : writeln;

void main()
{
	// Parentheses are always required for constructing structs, even when passing no arguments
	auto test = Test();				
	writeln("test     : ", test);
	writeln;

	auto test2 = Test2();
	writeln("test2    : ", test2);

	auto test2A = Test2('A');
	writeln("test2A   : ", test2A);

	auto test2AB = Test2('A', 42);
	writeln("test2AB  : ", test2AB);

	auto test2ABC = Test2('A', 42, 3.14);
	writeln("test2ABC : ", test2ABC);
}

struct Test
{
	int member = 42;
}

struct Test2
{
	char   c;
	int    i;
	double d;

	/* The rough equivalent of the compiler-generated automatic constructor.
	 * Real constructors don't return `result` like this, but instead initialize `this`.
	 * (Note: This is only for demonstration; 
	 *        the following constructor would not actually be called when default-constructing the object as Test().) 
	 */
	Test2 defaultConstructor(in char   c_parameter = char.init, 
							 in int    i_parameter = int.init, 
							 in double d_parameter = double.init)
	{
		Test2 result;

		result.c = c_parameter;
		result.i = i_parameter;
		result.d = d_parameter;

		return result;
	}
}
