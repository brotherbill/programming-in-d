import std.stdio : writeln;

void main()
{
	MyClass variable;
	int age = 21;
	int[] sliceA = [10, 20, 30, 40, 50];
	int[] sliceB = sliceA;

	if (variable is null)
	{
		writeln(__LINE__, " variable is null.");
	}

	if (null is null)
	{
		writeln(__LINE__, " null is null.");
	}

	if (null != null)
	{
		writeln(__LINE__, " null is not null (D would be like SQL).");
	}
	else
	{
		writeln(__LINE__, " null is null (D is not like SQL).");
	}	

	// This works, but is not recommended.
	// Use '==' for value comparisons instead.
	// See https://dlang.org/spec/operator.html#identity
	if (age is 21)
	{
		writeln(__LINE__, " age is 21");
	}

	// Recommended way to compare values.
	if (age == 21)
	{
		writeln(__LINE__, " age equals 21");
	}

	if (sliceA is sliceB)
	{
		writeln(__LINE__, " sliceA and sliceB reference the same elements");
	}
}


class MyClass
{
	int member;
}
