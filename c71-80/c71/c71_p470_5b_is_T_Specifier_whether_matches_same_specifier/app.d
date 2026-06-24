import std.stdio;

void main()
{
	auto var = new AlarmClock;

	myFunction(var); // (enum WeekDays will be defined below for another example)
	myFunction(WeekDays.Monday);
	const double number = 1.2;
	myFunction(number);
	myFunction(42);
}

void myFunction(T)(T parameter)
{
	static if (is(T == class))
	{
		writeln("This is a class type");
	}
	else static if (is(T == enum))
	{
		writeln("This is an enum type");
	}
	else static if (is(T == const))
	{
		writeln("This is a const type");
	}
	else
	{
		writeln("This is some other type");
	}
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
