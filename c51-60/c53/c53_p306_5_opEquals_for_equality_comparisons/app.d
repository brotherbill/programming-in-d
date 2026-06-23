void main()
{
	auto start  = TimeOfDay(hour: 8, minute: 30);
	auto finish = TimeOfDay(hour: 8, minute: 45);

	assert(start == finish);
	assert(!(start != finish));

	assert(TimeOfDay(20, 10) == TimeOfDay(20, 59));
}

struct TimeOfDay
{
	int hour;
	int minute;

	// Only compares if hour is same.  Silly example.
	bool opEquals()(auto ref const TimeOfDay rhs) const 
	{
		return hour == rhs.hour;
	}
}
