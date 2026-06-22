import std.stdio : readf, write, writeln, stdout;

void main()
{
	char firstCode;
	char secondCode;

	write("Please enter a letter: ");
	readf(" %s", &firstCode);
	readf(" %s", &secondCode);

	writeln("The letter that has been read: ", firstCode, secondCode);
	writeln;
	
	write("The letter that has been read: "); stdout.flush;
	write(firstCode);  stdout.flush;
	write(secondCode); stdout.flush;
	writeln;
}
