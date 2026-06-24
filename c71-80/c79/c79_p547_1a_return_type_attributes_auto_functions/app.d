import std.stdio;

void main()
{
	writeln("return type of add() is: ", typeof(add).stringof);
}

auto add(int first, double second)
{
	double result = first + second;
	return result;
}
