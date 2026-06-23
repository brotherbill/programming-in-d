import std.stdio : writeln, writefln;

void main()
{
	try
	{
		bar();
	}
	catch (Exception caughtException)
	{
		for (Throwable exc = caughtException; exc; exc = exc.next)
		{ // ← Meaning: as long as exc is not 'null'
			writefln("13 error message: %s", exc.msg);
			writefln("14 source file  : %s", exc.file);
			writefln("15 source line  : %s", exc.line);
			writeln();
		}
	}
}

void foo()
{
	try
	{
		throw new Exception("Exception thrown in foo");
	}
	finally
	{
		throw new Exception("Exception thrown in foo's finally block");
	}
}

void bar()
{
	try
	{
		foo();
	}
	finally
	{
		throw new Exception("Exception thrown in bar's finally block");
	}
}
