import std.stdio : writeln;

void main()
{
	int result;

	result = add(anAmount(), anotherAmount());
	writeln("result = ", result);
}

int add(int a, int b)
{
	return a + b;
}

int anAmount()
{
	writeln("anAmount called");
	return 100;
}

int anotherAmount()
{
	writeln("anotherAmount called");
	return 20;
}
