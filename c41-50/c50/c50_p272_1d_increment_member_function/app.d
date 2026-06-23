void main() { }

struct TimeOfDay
{
	import std.string;

	int hour;
	int minute;

	string toString() const
	{
		return format("%02s:%02s", hour, minute);
	}

	void increment(Duration duration)
	{
		minute += duration.minute;
		hour += minute / 60;
		minute %= 60;
		hour %= 24;
	}
}

struct Duration
{
	int minute;
}

TimeOfDay addDuration(TimeOfDay start, Duration duration)
{
	// Begin with a copy of start
	TimeOfDay result = start;

	// Add the duration to it
	result.minute += duration.minute;

	// Take care of overflows
	result.hour += result.minute / 60;
	result.minute %= 60;
	result.hour %= 24;
	return result;
}

unittest
{
	// A trivial test
	assert(addDuration(TimeOfDay(10, 30), Duration(10)) == TimeOfDay(10, 40));

	// A time at midnight
	assert(addDuration(TimeOfDay(23, 9), Duration(51)) == TimeOfDay(0, 0));

	// A time in the next day
	assert(addDuration(TimeOfDay(17, 45), Duration(8 * 60)) == TimeOfDay(1, 45));
}

unittest
{
	auto time = TimeOfDay(10, 30);

	// A trivial test
	time.increment(Duration(10));
	assert(time == TimeOfDay(10, 40));

	// 15 hours later must be in the next day
	time.increment(Duration(15 * 60));
	assert(time == TimeOfDay(1, 40));

	// 22 hours 20 minutes later must be midnight
	time.increment(Duration(22 * 60 + 20));
	assert(time == TimeOfDay(0, 0));
}
