void main()
{
	hour_only_tester;
	hour_minute_tester;
	overflow_tester;
}

void hour_only_tester()
{
	assert(TimeOfDayHour(20, 10).opCmp(TimeOfDayHour(23, 59)) < 0);
	assert(TimeOfDayHour(20, 10).opCmp(TimeOfDayHour(15, 59)) > 0);
	assert(TimeOfDayHour(20, 10).opCmp(TimeOfDayHour(20, 59)) == 0);
}

void hour_minute_tester()
{
	assert(TimeOfDay(20, 10).opCmp(TimeOfDay(20, 59)) <  0);
	assert(TimeOfDay(20, 10).opCmp(TimeOfDay(20,  5)) >  0);
	assert(TimeOfDay(20, 10).opCmp(TimeOfDay(20, 10)) == 0);
	assert(TimeOfDay(20, 10).opCmp(TimeOfDay(21, 10)) <  0);
	assert(TimeOfDay(20, 10).opCmp(TimeOfDay(15, 10)) >  0);
}

void overflow_tester() 
{
	assert(S(-2) > S(int.max));		// wrong sort order.  A negative number should not be larger than any positive number.
}

struct TimeOfDayHour
{
	int hour;
	int minute;

	// Only compares if hour is same.  Silly example.
	bool opEquals()(auto ref const TimeOfDayHour rhs) const 
	{
		return hour == rhs.hour;
	}

	// Only compares if hour is same.  Silly example.
	// negative if this <  rhs
	// zero     if this == rhs
	// positive if this >  rhs
	int opCmp()(auto ref const TimeOfDayHour rhs) const 
	{
		if (hour < rhs.hour) 
		{
			return -1;
		} 

		if (hour == rhs.hour)
		{
			return  0;
		} 
		              
		return  1;
	}
}

struct TimeOfDay
{
	int hour;
	int minute;

	bool opEquals()(auto ref const TimeOfDay rhs) const 
	{
		return hour == rhs.hour;
	}

	// Note: Subtraction is a bug here if the result can overflow.
	//       (See the following warning in text.)
	// negative if this <  rhs
	// zero     if this == rhs
	// positive if this >  rhs
	int opCmp()(auto ref const TimeOfDay rhs) const 
	{
		return (hour == rhs.hour)
			? minute - rhs.minute
			: hour   - rhs.hour;
	}
}

struct S
{
	int i;

	int opCmp(in S rhs) const 
	{
		return i - rhs.i;	// BUG
	}
}
