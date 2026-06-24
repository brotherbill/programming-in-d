import std.stdio;

void main()
{
	alias isInt = myTemplate!int;
	alias is42 = myTemplate!42;

	writeln("isInt: ", isInt);
	writeln("is42 : ", is42);
}

// T... means T is variadic, page 531 of Programming in D book
template myTemplate(T...) if (T.length == 1)
{
	static if (is(T[0]))
	{
		// The single parameter is a type
		enum bool myTemplate = true;
	}
	else
	{
		// The single parameter is some other kind
		enum bool myTemplate = false;
	}
}
