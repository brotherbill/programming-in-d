import std.stdio;

void main()
{
	do_something;
}

// Same as Eiffel obsolete clause
deprecated("Please use doSomething() instead.")		// No trailing semicolon, please
void do_something() {
	writeln("Using Eiffel snake_case, which doesn't pass D language style guide");
}

void doSomething() {
	writeln("Using clean, mother approved camelCase styling which passes the D language style guide");
}