void main()
{
	import std.stdio : writeln;

	writeln("add(5, 10)                 = ", add(5, 10));
	writeln("complexCalculation(25, 25) = ", complexCalculation(25, 25));
	writeln("complexCalculation(86, 99) = ", complexCalculation(86, 99));
}

// This has a single return statement
int add(int first, int second) 
{
	int result = first + second;
	return result;
}

// This has multiple return statements
int complexCalculation(int aParameter, int anotherParameter)
{
	if (aParameter == anotherParameter)
	{
		return 0;
	}

	return aParameter * anotherParameter;
}
