import std.stdio;

void main()
{
	// Calling with a struct object
	myFunction(Point());

	// Calling with a class reference
	myFunction(new AlarmClock);

	// Calling with an enum value
	myFunction(WeekDays.Monday);

	// Calling with a function pointer
	myFunction(&foo);
}

struct Point
{
	// ...
}

interface Clock
{
	// ...
}

class AlarmClock : Clock
{
	// ...
}

enum WeekDays
{
	Monday,
	Tuesday,
	Wednesday,
	Thursday,
	Friday,
	Saturday,
	Sunday
}

char foo(double d, int i, Clock c)
{
	return 'a';
}

void myFunction(T)(T parameter)
{
	static if (is(T LocalAlias == struct))
	{
		writefln("\n--- struct ---");

		// LocalAlias is the same as T. 
		// 'parameter' is the struct object that has been passed to this function.
		writefln("Constructing a new %s object by copying it.", LocalAlias.stringof);
		LocalAlias theCopy = parameter;
	}

	static if (is(T baseTypes == super))
	{
		writeln("\n--- super ---");
		// The 'baseTypes' tuple contains all of the base types of T. 
		// 'parameter' is the class variable that has been passed to this function.
		writefln("class %s has %s base types.", T.stringof, baseTypes.length);
		writeln("All of the bases: ", baseTypes.stringof);
		writeln("The topmost base: ", baseTypes[0].stringof);
	}

	static if (is(T ImplT == enum))
	{
		writeln("\n--- enum ---");
		// 'ImplT' is the actual implementation type of this enum type.
		// 'parameter' is the enum value that has been passed to this function.
		writefln("The implementation type of enum %s is %s", T.stringof, ImplT.stringof);
	}

	static if (is(T ReturnT == return))
	{
		writeln("\n--- return ---");
		// 'ReturnT' is the return type of the function pointer that has been passed to this function.
		writefln("This is a function with a return type of %s:", ReturnT.stringof);
		writeln("    ", T.stringof);
		write("calling it... ");

		// Note: Function pointers can be called like functions
		ReturnT result = parameter(1.5, 42, new AlarmClock);
		writefln("and the result is '%s'", result);
	}
}
