import std.stdio : writeln;
import std.string : format;

void main()
{
    immutable start = TimeOfDay(5, 30);
    string sStart = start.toString;     // Won't compile: toString is not 'const'

    writeln("sStart: ", sStart);
    writeln("start : ", start);
}

struct TimeOfDay
{
    int hour;
    int minute;

    // inferior design: not marked as 'const'
    string toString() 
    {
        return format("%02s:%02s", hour, minute);
    }
}
