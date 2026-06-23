import std.stdio : writeln;
import std.random : uniform; // Breaks under D language version 2.111.0 in Windows 11.  Works fine on Linux.

void main()
{
	foo;
}

void throwsHalfTheTime()
{
	if (uniform(0, 2) == 1)
	{
		writeln("13 throwsHalfTheTime() is throwing an exception this time");
		throw new Exception("the error message");
	}
	else {
		writeln("17 throwsHalfTheTime() is NOT throwing an exception this time");
	}
}

void foo()
{
	writeln("23 the first line of foo()");

	try
	{
		writeln("27 the first line of the try block");
		throwsHalfTheTime();
		writeln("29 the last line of the try block");
		// ... there may be one or more catch blocks here ...
	}
	finally
	{
		writeln("34 the body of the finally block");
	}

	writeln("37 the last line of foo()");
}
