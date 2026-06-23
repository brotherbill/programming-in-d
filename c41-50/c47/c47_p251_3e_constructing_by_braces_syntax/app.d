import std.stdio : writeln;

void main()
{
	TimeOfDay wakeUpAlarm = TimeOfDay(5, 30);	// wake up     at 5:30
	TimeOfDay periodStart = {8, 30};			// periodStart at 8:30
	auto wontCompile      = {8, 30};			// cannot infer type from struct initializer

	TimeOfDay t1a = {minute: 42, hour: 7};		// t1a is  7:42.  Notice that named members may be in any order.
	TimeOfDay t1b = {minute: 42};				// t1b is  0:42.  default hour member
	TimeOfDay t1c = {minute: 42, 7};			// Won't compile.  minute is named, as well as positional.  Can't provide minute twice.

	TimeOfDay t2a = {hour: 9, minute: 15};		// t2a is  9:15.  Natural order, all explicit
	TimeOfDay t2b = {hour: 9};					// t2b is  9:00.  default minute member
	TimeOfDay t2c = {hour: 9, 15};				// t2c is  9:15.  hour is named, minute is in positional order
	TimeOfDay t2d = {9, minute: 15};			// t2d is  9:15.  hour is in positional order, minute is named

	writeln("wakeupAlarm: ", wakeUpAlarm);
	writeln("periodStart: ", periodStart);
	writeln;
	writeln("t1a        : ", t1a);
	writeln("t1b        : ", t1b);
	writeln;
	writeln("t2a        : ", t2a);
	writeln("t2b        : ", t2b);
	writeln("t2c        : ", t2c);
	writeln("t2d        : ", t2d);
}

struct TimeOfDay
{
	int hour;
	int minute;
}
  