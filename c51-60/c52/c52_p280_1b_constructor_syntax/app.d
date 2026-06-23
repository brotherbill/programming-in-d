import std.stdio : writeln;

void main()
{
	SomeStruct someStruct = SomeStruct(86, 99);
	writeln("someStruct: ", someStruct);
}

struct SomeStruct
{
	int a;
	int b;

	// constructor parameters
	this(in int argA, in int argB)
	in (argA >= 0 && argB >= 0)
	out (; a >= 0 && b >= 0)
	do
	{
		// ... operations that prepare the object for use ...
		writeln("SomeStruct constructing with two parameters");
		a = argA;
		b = argB;
	}
}
