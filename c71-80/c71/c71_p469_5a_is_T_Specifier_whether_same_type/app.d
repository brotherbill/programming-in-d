import std.stdio;

void main()
{
    auto alarmClock = new AlarmClock;
    myFunction(alarmClock);
    writeln;

    Clock clock = alarmClock;
    myFunction(clock);
    writeln;

    myFunction(42);
}

interface Clock
{
    void tellTime();
}

class AlarmClock : Clock
{
    override void tellTime()
    {
        writeln("10:00");
    }
}

void myFunction(T)(T parameter)
{
    static if (is(T == Clock))
    {
        // If we are here then T is directly/exactly a Clock
        writeln("This is a Clock; we can tell the time");
        parameter.tellTime();
    }
    else
    {
        writeln("This is not a Clock");
    }
}
