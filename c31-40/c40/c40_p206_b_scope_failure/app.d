import std.stdio : writeln;

void main()
{
	int a = 100;

	try {
		add_42_to_r_scope_failure_on_throwsException_verbose(a);
		// add_42_to_r_scope_failure_on_noException_verbose(a);
		// add_42_to_r_scope_failure_on_throwsException_terse(a);
		// add_42_to_r_scope_failure_on_noException_terse(a);
	}
	catch (Exception exc)
	{
		writeln(__LINE__, " catch in main: ", exc.msg);
	}

	writeln(__LINE__, " main: after scope_function, a = ", a);
}

void throwsException()
{
	writeln(__LINE__, " throwException");

	// A completely useless exception message.  I have seen too many of these in the wild.
	throw new Exception("You shouldn't have done that!");
}

void add_42_to_r_scope_failure_on_throwsException_verbose(ref int r) 
{
	writeln("--- add_42_to_r_scope_failure_on_throwsException_verbose ---");
	immutable int initial_r = r;

	writeln(__LINE__, " r = ", r);
	immutable int addend = 42;

	// Clean up code that runs when an exception is thrown in the same scope block
	scope (failure)
	{
		r = initial_r;
		writeln(__LINE__, " this scope comes first but runs second on failure.  scope restored  r, r = ", r);
	}

	writeln(__LINE__, " before adding addent to r in normal flow, r = ", r);
	r += addend;
	writeln(__LINE__, " after adding addent to r in normal flow, r = ", r);

	scope (failure)
	{
		writeln(__LINE__, " this scope comes later but runs first on failure.  Does nothing.  r = ", r);
	}

	writeln(__LINE__, " before throwsException, r = ", r);
	throwsException;
	writeln(__LINE__, " after throwsException, r = ", r);
}

// Writes out line 31 and 33 with stack trace, doesn't write line 13
void add_42_to_r_scope_failure_on_noException_verbose(ref int r) 
{
	writeln("--- add_42_to_r_scope_failure_on_noException_verbose ---");
	immutable int initial_r = r;

	writeln(__LINE__, " r = ", r);
	int addend = 42;

	// Clean up code that runs when an exception is thrown in the same scope block
	scope (failure)
	{
		r = initial_r;
		writeln(__LINE__, " this scope comes first but runs second on failure.  scope restored  r, r = ", r);
	}

	writeln(__LINE__, " before adding addent to r in normal flow, r = ", r);
	r += addend;
	writeln(__LINE__, " after adding addent to r in normal flow, r = ", r);

	scope (failure)
	{
		writeln(__LINE__, " this scope comes later but runs first on failure.  Does nothing.  r = ", r);
	}
}

// Writes out line 31 and 33 with stack trace, doesn't write line 13
void add_42_to_r_scope_failure_on_throwsException_terse(ref int r) 
{
	immutable int initial_r = r;

	int addend = 42;

	// Clean up code that runs when an exception is thrown in the same scope block
	scope (failure)
	{
		r = initial_r;
		writeln(__LINE__, " this scope comes first but runs last on failure.  Restored r, r = ", r);
	}

	r += addend;

	scope (failure)
	{
		writeln(__LINE__, " this scope comes later but runs first on failure, r = ", r);
	}

	throwsException;
	writeln(__LINE__, " after throwsException, r = ", r);
}

// Writes out line 31 and 33 with stack trace, doesn't write line 13
void add_42_to_r_scope_failure_on_noException_terse(ref int r) 
{
	immutable int initial_r = r;

	int addend = 42;

	// Clean up code that runs when an exception is thrown in the same scope block
	scope (failure)
	{
		r = initial_r;
		writeln(__LINE__, " this scope comes first but runs last on failure.  Restored r, r = ", r);
	}

	r += addend;

	scope (failure)
	{
		writeln(__LINE__, " this scope comes later but runs first on failure, r = ", r);
	}
}
