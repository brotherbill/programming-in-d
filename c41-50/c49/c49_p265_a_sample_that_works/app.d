import std.stdio;

void main()
{
	print(1.2);
	print(3);
	print("Greetings!");
	writeln;

	printDouble(1.2);
	printInt(3);
	printString("Greetings!");
}

void print(double d)
{
	writeln(__LINE__, " Floating point: ", d);
}

void print(int i)
{
	writeln(__LINE__, " Integer       : ", i);
}

void print(string str)
{
	writeln(__LINE__, " String        : ", str);
}

void printDouble(double d)
{
	writeln(__LINE__, " Floating point: ", d);
}

void printInt(int i)
{
	writeln(__LINE__, " Integer       : ", i);
}

void printString(string str)
{
	writeln(__LINE__, " String        : ", str);
}
