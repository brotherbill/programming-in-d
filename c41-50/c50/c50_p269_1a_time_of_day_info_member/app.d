import std.stdio : stderr, write, writef, writeln;

void main()
{
	auto time = TimeOfDay(10, 30);
	time.info();
	stderr.writeln;

	auto morning = TimeOfDay(10, 0);
	auto evening = TimeOfDay(22, 0);

	morning.info();
	stderr.write('-');
	evening.info();
	stderr.writeln();
}

struct TimeOfDay
{
	int hour;
	int minute;

	void info()
	{ // (1)
		stderr.writef("%02s:%02s", hour, minute); // (2)
	}
}
