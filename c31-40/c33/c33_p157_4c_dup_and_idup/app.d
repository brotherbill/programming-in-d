import std.stdio : writeln;

void main()
{
	char[] salutation; 		// mutable slice
	// foo(salutation);		//  ←  compilation ERROR, salutation is char[], foo expects const(char)[]

	auto ifoo = salutation.idup; // This compiles, where ifoo is a string.
	writeln("ifoo has type: ", typeof(ifoo).stringof); // string
	foo(ifoo);

	auto dfoo = salutation.dup;
	writeln("dfoo has type: ", typeof(dfoo).stringof);
	// foo(dfoo);				// won't compile.  Same error as line 6
}

void foo(string s)
{

}
