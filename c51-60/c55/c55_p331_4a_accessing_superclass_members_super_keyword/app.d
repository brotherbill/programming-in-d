import std.stdio : writeln, writefln;

void main() {
    auto alarmClock = new AlarmClock;            // Default constructor
    alarmClock.adjust(3, 15, 59);                // Manually set member values
    alarmClock.adjustAlarm(5, 0);

    writefln("%02s:%02s:%02s", alarmClock.hour, alarmClock.minute, alarmClock.second);
    writefln("Alarm set for %02s:%02s", alarmClock.alarmHour, alarmClock.alarmMinute);

	alarmClock.foo();
}

class AlarmClock: Clock {
    int alarmHour;
    int alarmMinute;
	// string minute;					// This "shadows" inherited 'minute', which isn't even the same type!.  Advanced topic.

    void adjustAlarm(int hour, int minute) {
        alarmHour = hour;
        alarmMinute = minute;
    }

	void foo() {
		super.minute = 10;		// The inherited 'minute' member from direct parent.  Direct parent must have this 'member' or have inherited it from ancestor class.
		// minute = "What?";	// If AlarmClock doesn't introduce 'minute', this is equivalent to super.minute.
								// But this AlarmClock has introduced 
		writeln("super.minute: ", super.minute);
		writeln("      minute: ", minute);
	}
}

class Clock {
    int hour;
    int minute;
    int second;

    void adjust(int hour, int minute, int second = 0) {
        this.hour   = hour;
        this.minute = minute;
        this.second = second;
    }
}
