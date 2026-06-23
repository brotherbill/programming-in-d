import std.stdio : writeln, writefln;
import std.conv  : to;

void main()
{
	cast_duration_to_double_test;
	implicit_bool_casts_that_work_test;
	implicit_bool_casts_that_do_not_work_test;
}

void cast_duration_to_double_test() 
{
	auto duration = Duration(2, 30);
	double d  =   to!double(duration);
	double d2 = cast(double)duration;

	// (could be 'cast(double)duration' as well)
	writefln("d : %f",d);
	writefln("d2: %f",d2);
	writeln;
}

void implicit_bool_casts_that_work_test() 
{
	auto duration = Duration(2, 30);

	if (duration) 
	{
		writeln("if (duration) works");
	}

	while (duration)
	{
		writeln("while (duration) works");
		break;
	}

	auto r = duration ? 1 : 2;
	writeln("r: ", r);
}

void implicit_bool_casts_that_do_not_work_test() 
{
	auto duration = Duration(2, 30);

	// foo(duration);		// Won't compile as no implicit conversion here
	// bool b = duration;	// Won't compile as no implicit conversion here
}

void foo(bool b)
{
	// no need for body, as compiler rejects implicit conversion to bool
}

struct Duration
{
	int hour;
	int minute;

	// This opCast allows us to convert a Duration to a double, 
	// representing the total hours and minutes as a fraction of an hour.
	// For example, 2 hours and 30 minutes would be converted to 2.5 hours.
	double opCast(T : double)() const
	{
		return hour + (to!double(minute) / 60);
	}

	bool opCast(T : bool)() const
	{
		return (hour != 0) || (minute != 0);
	}
}
