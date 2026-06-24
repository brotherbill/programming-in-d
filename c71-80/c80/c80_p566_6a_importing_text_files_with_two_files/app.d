import std.stdio;

void main()
{
	string s = import("file_one.txt");
	writeln("s: ", s);
	mixin(import("file_two.txt"));
}
