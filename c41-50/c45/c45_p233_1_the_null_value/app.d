import std.stdio;

void main()
{
	writeln(" ", __LINE__, " null           : ", null);

	// Create a reference to a class instance
	auto variable = new MyClass;

	writeln(__LINE__, " variable       : ", variable);
	writeln(__LINE__, " variable.member: ", variable.member);

	if (variable == null) 	// This won't compile.  Use: (variable is null)
	// if (variable is null)		// This will compile with D mother approved is operator 
	{
		writeln(__LINE__, " variable is null");
	}
}

class MyClass
{
	int member;
}
