import std.stdio : writefln, writeln;

void main()
{
	int value = 100;

	writefln("In a field of 10 characters:|%10s|", value);
	writefln("In a field of 5 characters :|%5s|",  value);
	writeln;

	writefln("In a field of 10 characters:|%-10s|", value);
	writefln("In a field of 5 characters :|%-5s|",  value);
}
