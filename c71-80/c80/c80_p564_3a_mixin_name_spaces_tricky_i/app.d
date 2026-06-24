import std.stdio;

void main()
{
	int i;
	mixin Templ;

	i = 42; 	// Sets the 'i' that is defined explicitly in main
	writeln(i); // Prints the 'i' that is defined explicitly in main
	print(); 	// Prints the 'i' that is mixed in
}

template Templ()
{
	int i;

	void print()
	{
		writeln(i); // Always the 'i' that is defined in Templ
	}
}
