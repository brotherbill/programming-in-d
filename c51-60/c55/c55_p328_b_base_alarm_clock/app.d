import std.stdio : writefln;

void main()
{
    auto alarmClock = new AlarmClock;   // Default constructor
    alarmClock.adjust(3, 15, 59);       // Manually set member values, from Clock
    alarmClock.adjustAlarm(5, 0);       // Manually set member values, from AlarmClock  

    writefln("%02s:%02s:%02s", alarmClock.hour, alarmClock.minute, alarmClock.second);
    writefln("Alarm set for %02s:%02s", alarmClock.alarmHour, alarmClock.alarmMinute);
}

class AlarmClock
{
    int hour;           // from Clock
    int minute;         // from Clock
    int second;         // from Clock   
    int alarmHour;      // from AlarmClock
    int alarmMinute;    // from AlarmClock

    // From Clock
    void adjust(int hour, int minute, int second = 0)
    {
        this.hour   = hour;
        this.minute = minute;
        this.second = second;
    }

    // From AlarmClock
    void adjustAlarm(int hour, int minute)
    {
        alarmHour   = hour;
        alarmMinute = minute;
    }
}
