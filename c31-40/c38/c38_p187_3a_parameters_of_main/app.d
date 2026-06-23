import std.stdio;

void main(string[] args)
{
	foreach (i, arg; args)
	{
		writefln("Argument %-3s: %s", i, arg);
	}
}
