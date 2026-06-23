import std.stdio : writefln;

void main() {
	auto clock = new Clock(17, 15, 0);
	writefln("     clock:  %02s:%02s:%02s", clock.hour, clock.minute, clock.second);

	auto alarmClock = new AlarmClock(17, 15, 0, 6, 30);
	writefln("alarmClock:  time set to: %02s:%02s:%02s, alarm set to %s:%s",
		alarmClock.hour, alarmClock.minute, alarmClock.second,
		alarmClock.alarmHour, alarmClock.alarmMinute);
}

class Clock {
	int hour;
	int minute;
	int second;

	this(int hour, int minute, int second) {
		this.hour   = hour;
		this.minute = minute;
		this.second = second;
	}
}

class AlarmClock : Clock {
	int alarmHour;
	int alarmMinute;

	//   --- Clock members -------------   --- AlarmClock members -------
	this(int hour, int minute, int second, int alarmHour, int alarmMinute)  	
	{
		super(hour, minute, second);	// This must be the first statement in the constructor to set the base class members.
		this.alarmHour   = alarmHour;	// This sets AlarmClock member: alarmHour
		this.alarmMinute = alarmMinute;	// This sets AlarmClock member: alarmMinute
	}
	// ...
}
