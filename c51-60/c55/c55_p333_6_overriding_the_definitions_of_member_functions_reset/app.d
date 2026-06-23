import std.stdio  : writeln;
import std.string : format;

void main() {
	auto deskClock = new AlarmClock(10, 15, 0, 6, 45);
	writeln(deskClock);
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

	void reset() {
		hour   = 0;
		minute = 0;
		second = 0;
	}

	override string toString() const {
		return format("%02s:%02s:%02s", hour, minute, second);
	}
}

class AlarmClock : Clock {
	int alarmHour;
	int alarmMinute;

	//   --- Clock parameters -----------  --- AlarmClock parameters ----
	this(int hour, int minute, int second, int alarmHour, int alarmMinute)
	{
		super(hour, minute, second);
		this.alarmHour   = alarmHour;
		this.alarmMinute = alarmMinute;
	}

	override void reset() {
		super.reset;
		alarmHour   = 0;
		alarmMinute = 0;
	}

	override string toString() const {
		return format("time %s alarm %02s:%02s", super.toString, alarmHour, alarmMinute);
	}
}
