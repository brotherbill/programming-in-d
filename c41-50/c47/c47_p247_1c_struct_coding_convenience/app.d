import std.stdio : writeln;

void main()
{
	TimeOfDay bedTime;
	TimeOfDay wakeUpTime;
}

struct TimeOfDay
{
	int hour;
	int minute;
}

struct Meeting
{
	string    topic;
	size_t    attendanceCount;
	TimeOfDay start;
	TimeOfDay end;
}

struct Meal
{
	string beverage;
	string appetizer;
	string entree;
	string dessert;
}

struct DailyPlan
{
	Meeting projectMeeting;
	Meal    lunch;
	Meeting budgetMeeting;
}

void addDuration(TimeOfDay start, TimeOfDay duration, out TimeOfDay result)
{
	result.hour    = start.hour    + duration.hour;
	result.minute  = start.minute  + duration.minute;
	result.hour   += result.minute / 60;
	result.minute %= 60;
	result.hour   %= 24;
}

TimeOfDay addDuration(TimeOfDay start, TimeOfDay duration)
{
	TimeOfDay result;

	result.hour    = start.hour    + duration.hour;
	result.minute  = start.minute  + duration.minute;
	result.hour   += result.minute / 60;
	result.minute %= 60;
	result.hour   %= 24;

	return result;
}
