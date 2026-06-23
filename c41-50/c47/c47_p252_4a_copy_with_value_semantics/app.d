void main()
{
	auto yourLunchTime = TimeOfDay(12, 0);
	auto myLunchTime   = yourLunchTime;

	// Only my lunch time becomes 12:05:
	myLunchTime.minute += 5;

	// ... your lunch time is still the same:
	assert(myLunchTime.minute   == 5);
	assert(yourLunchTime.minute == 0);
}

struct TimeOfDay
{
	int hour;
	int minute;
}
