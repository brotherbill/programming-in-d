import std.stdio;
import std.string;

void main()
{
	char[] name;

	write("What is your name? ");
	readln(name);
	name = strip(name);
	writeln("Hello ", name, "!");
}
