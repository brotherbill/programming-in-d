import std.stdio;

void main()
{
	myTemplate(&myFunction); // Taking the function's address and passing it as a parameter
}

int myFunction(char c, double d)
{
	return 42;
}

void myTemplate(T)(T parameter)
{
	writeln("type : ", T.stringof);
	writeln("value: ", parameter);
}
