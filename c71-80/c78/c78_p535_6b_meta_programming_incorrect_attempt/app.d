import std.stdio;

void main()
{
	writeln(sum!4());
}

// WARNING: This code is incorrect and will lead to a stack overflow
int sum(int last)()
{
	return (last == 0 ? last : last + sum!(last - 1)());
}
