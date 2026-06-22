import std.stdio : write, writeln;

void main()
{
	string[] container = ["January", "February", "March"];
	size_t i = 0;

	foreach (element; container)
	{
		writeln(i, ": ", element);
		++i;
	}
	writeln;

	auto numbers = [1, 0, 15, 10, 3, 5, 20, 30];
	writeln("numbers: ", numbers);
	writeln("Count values divisible by 10");

	size_t count = 0;

	foreach (number; numbers)
	{
		if ((number % 10) == 0)
		{
			++count;
			write(count);
		}
		else
		{
			write(' ');
		}
		writeln(": ", number);
	}
}
