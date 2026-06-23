import std.stdio : writeln, stdout, stderr;

void main()
{
	writeln("From stdout");
	stdout.writeln("Another from stdout");
	stderr.writeln("From stderr");
}
