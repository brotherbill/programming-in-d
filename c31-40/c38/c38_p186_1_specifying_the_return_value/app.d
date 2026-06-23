import std.stdio : stderr, write, writefln;

int main()
{
	int number;
	write("Please enter a number between 3 and 6: ");
	readf(" %s", &number);

	if (!(3 <= number && number <= 6))
	{
		stderr.writefln("ERROR: %s is not valid!", number);
		return 111;
	}

	writefln("Thank you for %s.", number);

	return 0;
}
