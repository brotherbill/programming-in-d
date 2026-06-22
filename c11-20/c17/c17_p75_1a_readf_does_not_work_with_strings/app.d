import std.stdio : write, writeln, readf;

void main()
{
	char[] name;

	write("What is your name? ");
	readf(" %s", &name);

	writeln("Greetings ", name, "!");
}
