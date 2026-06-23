import std.stdio : writeln;

void main()
{
	byte smallValue = 7;
	func(smallValue); // automatic type conversion from byte to int
}

void func(int number)
{
	writeln("func number: ", number);
}
