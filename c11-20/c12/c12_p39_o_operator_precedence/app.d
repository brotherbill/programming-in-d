import std.stdio;

void main()
{
	int value = 77;
	int result = (((value + 8) * 3) / (value - 1)) % 5;

	writeln("value = ", value, " and result (((value + 8) * 3) / (value - 1)) % 5 = ", result);
}
