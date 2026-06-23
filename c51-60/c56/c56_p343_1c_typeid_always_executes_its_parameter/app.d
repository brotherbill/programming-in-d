void main()
{
	const s  = foo("sizeof").sizeof; 	// foo() is not called
	alias T  = typeof(foo("typeof")); 	// foo() is not called
	auto  ti = typeid(foo("typeid")); 	// foo() is called
}

int foo(string when)
{
	import std.stdio : writefln;
	
	writefln("Called during '%s'.", when);
	return 0;
}
