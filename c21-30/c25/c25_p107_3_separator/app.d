import std.stdio;

void main()
{
	writefln("%s  : %,f", "%,f",  1_234.5678);	// Groups of 3 (default)
	writefln("%s  : %,s", "%,s",  1_000_000); 	// Groups of 3 (default)
	writefln("%s : %,2s", "%,2s", 1_000_000); 	// Groups of 2
	writeln;

	writefln("%s : %,*s", "%,*s", 4, 100_0000); // Groups of 4
	writeln;

	writefln("%s : %,?s", "%,?s",     '-', 1_000_000);	// Separator is hyphen, groups of 3 (default)
	writefln("%s: %,*?s", "%,*?s", 4, '-', 100_0000); 	// Separator is hyphen, groups of 4
}
