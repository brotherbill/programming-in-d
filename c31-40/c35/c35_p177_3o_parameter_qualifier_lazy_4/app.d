import std.stdio : writeln;

void main()
{
	functionWithLazyParameter(valueOfArgument());
	functionWithLazyParameter(valueOfArgumentPure);
}

void functionWithLazyParameter(lazy int value)
{
	int result = value + value + value;
	writeln(result);
}

int valueOfArgument() 
{
	writeln("Calculating...");
	return 1;
}

int valueOfArgumentPure() pure
{
	debug writeln("Calculating...");
	return 1;
}
