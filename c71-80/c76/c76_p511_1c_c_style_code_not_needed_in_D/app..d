import std.stdio;

void main()
{
	writeln("foo() is: ", foo());
}

// --- C code --
int foo()
{
	int error = 42;

	if (error)
	{
		goto finallyDone; // finally is keyword used in try-catch-finally exception handling
	}

	error = 86;

finallyDone:
	// ... cleanup operations ...
	return error;
}
