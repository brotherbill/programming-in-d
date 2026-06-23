import std.stdio  : writeln;
import std.string : format;

void main()
{
    auto variable0 = new Clock(6, 7, 8);
    auto variable1 = new Clock(6, 7, 8);
    assert(variable0 !is variable1); // They are not the same object in memory
    assert(variable0 != variable1);  // Without overriding opEqual, it has the same semantics as !is.

    auto partner0 = new Clock(9, 10, 11);
    auto partner1 = partner0;
    assert(partner0 is partner1); // They are the same object in memory 
    assert(partner0 == partner1); // Without overriding opEqual, it has the same semantics as is.
}

class Clock
{
    int hour;
    int minute;
    int second;

    this(int hour, int minute, int second)
    {
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    }

    override string toString() const
    {
        return format("%02s:%02s:%02s", hour, minute, second);
    }
}

class AlarmClock : Clock
{
    int alarmHour;
    int alarmMinute;

    this(int hour, int minute, int second, // for Clock's members
        int alarmHour, int alarmMinute)
    { // for AlarmClock's members
        super(hour, minute, second);
        this.alarmHour = alarmHour;
        this.alarmMinute = alarmMinute;
    }

    override string toString() const
    {
        return format("time %s, alarm %02s:%02s", super.toString(), alarmHour, alarmMinute);
    }
}
