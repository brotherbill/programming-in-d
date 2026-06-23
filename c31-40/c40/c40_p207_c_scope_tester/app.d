import std.stdio : writeln;

void main()
{
	try 
	{
		test();
	} 
	catch (Exception e) {
		writeln(__LINE__, " Caught exception: ", e.msg);
	}
}

void test()
{
	writeln(__LINE__, " --- Start of test ---");
	scope (exit) writeln(__LINE__, " when exiting 1");
	scope (success)
	{
		writeln(__LINE__, " if successful 1");
		writeln(__LINE__, " if successful 2");
	}
	scope (failure) writeln(__LINE__, " if thrown 1");
	scope (exit)	writeln(__LINE__, " when exiting 2");

	// Uncomment next line to see `failure' behavior
	// throwsAllTheTime();

	scope (failure) writeln(__LINE__, " if thrown 2");

	writeln(__LINE__, " --- End of test ---");
}

void throwsAllTheTime()
{
	throw new Exception("Cause of exception");
}
