import std.stdio;

void main()
{
	// This scope is not associated with any statement:
	{
		int a;
		writeln("&a on line  7 is ", &a);
	}

	// Another one:
	{
		int a; // This 'a' is different from the previous one
		writeln("&a on line 13 is ", &a);
	}

	// Another one, different type:
	{
		string a; // This 'a' is different from the previous two
		writeln("&a on line 19 is ", &a); 
	}

	writeln;
	writeln("App completed");
}
