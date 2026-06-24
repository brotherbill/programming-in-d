import std.stdio;

void main()
{
	auto var = new AlarmClock;
	myFunction(var);
	writeln;

	myFunction(42);
}

interface Clock
{
	void tellTime();
}

class AlarmClock : Clock
{
	override void tellTime()
	{
		writeln("10:00");
	}
}

void myFunction(T)(T parameter)
{
	static if (is(T : Clock))
	{
		// If we are here then T can be used as a Clock
		writeln("This is a Clock; we can tell the time");
		parameter.tellTime();
	}
	else
	{
		writeln("This is not a Clock");
	}
}
