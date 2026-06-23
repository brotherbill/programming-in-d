import std.stdio : writeln;
import std.string : format;

void main()
{
    immutable start = TimeOfDay(5, 30);

    writeln("start: ", start);
}

struct TimeOfDay
{
    int hour;
    int minute;

    string toString() const
    {
        return format("%02s:%02s", hour, minute);
    }
}
