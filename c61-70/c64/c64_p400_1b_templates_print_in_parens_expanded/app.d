import std.stdio;

void main()
{
	printInParens(42); 		// with int
	printInParens(1.2); 	// with double

	auto myValue = MyStruct();
	printInParens(myValue); // with MyStruct
}

// void printInParens(T)(T value) {
//     writefln("(%s)", value);
// }

// Note: These functions are not part of the source code
//       They are the equivalents of the functions that the compiler would automatically generate

void printInParens(int value)
{
	writefln("(%s)", value);
}

void printInParens(double value)
{
	writefln("(%s)", value);
}

void printInParens(MyStruct value)
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
