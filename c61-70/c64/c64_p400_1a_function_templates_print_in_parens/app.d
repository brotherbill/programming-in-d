import std.stdio;

void main()
{
	printInParens(42); 		// with int
	printInParens(1.2); 	// with double

	auto myValue = MyStruct();
	printInParens(myValue); // with MyStruct
}

void printInParens(T)(T value)
{
	writefln("(%s)", value);
}

struct MyStruct
{
	string toString() const
	{
		return "hello";
	}
}
