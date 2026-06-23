import std.stdio : writeln;
import std.string : format;

void main()
{
    immutable start  = TimeOfDay(5, 30);
    string    sStart = start.toString;
    writeln("sStart: ", sStart);
    writeln("start : ", start);
}

struct TimeOfDay
{
    int hour;
    int minute;

    // placing const to the left instead of after the parameters is legal, but confusing.
    // best practice is to put const after the parameters
    const string toString() 
    {
        return format("%02s:%02s", hour, minute);
    }
}
