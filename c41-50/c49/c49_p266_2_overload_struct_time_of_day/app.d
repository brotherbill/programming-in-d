import std.stdio : write, writeln, writef, writefln;

void main()
{
	info(1.2);
	writeln;
	info(3);
	writeln;
	info("hello");
	writeln;
	writeln;

	auto breakfastTime = TimeOfDay(7, 0);
	info(breakfastTime);
	writeln;

	auto bikeRideMeeting = Meeting("Bike Ride", 3, TimeOfDay(9, 0), TimeOfDay(9, 10));
	info(bikeRideMeeting);
	writeln;
}

void info(double number)
{
	write("Floating point: ", number);
}

void info(int number)
{
	write("Integer       : ", number);
}

void info(string str)
{
	write("String        : ", str);
}

void info(TimeOfDay time)
{
	writef("TimeOfDay     : %02s:%02s", time.hour, time.minute);
}

void info(Meeting meeting)
{
	info(meeting.start);
	write('-');
	info(meeting.end);
	writefln(" \"%s\" meeting with %s attendees",
		meeting.topic,
		meeting.attendanceCount);
}

struct TimeOfDay
{
	int hour;
	int minute;
}

struct Meeting
{
	string topic;
	size_t attendanceCount;
	TimeOfDay start;
	TimeOfDay end;
}
