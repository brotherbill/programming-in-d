import std.stdio : writefln;

void main()
{
    auto alarmClock = new AlarmClock;   // Default constructor
    alarmClock.adjust(3, 15, 59);       // Manually set member values, for Clock part
    alarmClock.adjustAlarm(5, 0);       // Manually set member values, for AlarmClock part

    writefln("%02s:%02s:%02s", alarmClock.hour, alarmClock.minute, alarmClock.second);
    writefln("Alarm set for %02s:%02s", alarmClock.alarmHour, alarmClock.alarmMinute);
}

class AlarmClock : Clock
{
    int alarmHour;
    int alarmMinute;

    void adjustAlarm(int hour, int minute)
    {
        alarmHour   = hour;
        alarmMinute = minute;
    }
}

class Clock
{
    int hour;
    int minute;
    int second;

    void adjust(int hour, int minute, int second = 0)
    {
        this.hour   = hour;
        this.minute = minute;
        this.second = second;
    }
}
