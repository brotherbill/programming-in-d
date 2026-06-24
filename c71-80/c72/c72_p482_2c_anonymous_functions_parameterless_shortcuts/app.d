import std.stdio;

void main()
{
	foo(function double() { return 100.01; }); 	// full syntax
	foo(function() { return 200.02; }); 		// remove return type
	foo(function{ return 300.03; }); 			// remove parentheses for parameterless parameters
	foo({ return 400.04; }); 					// remove 'function' keyword
}

void foo(double function() func)
{
	writeln("foo called with: ", func());
}
