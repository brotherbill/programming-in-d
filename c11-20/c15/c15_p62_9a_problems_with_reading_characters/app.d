import std.stdio;

void main()
{
	char letter;	// ASCII character.  Can't squeeze Unicode-16 or Unicode-32 characters into this.

	write("Please enter a letter: ");
	readf(" %s", &letter);

	writeln("The letter that has been read: ", letter);
}
