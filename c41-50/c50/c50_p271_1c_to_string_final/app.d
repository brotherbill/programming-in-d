void main() 
{
    import std.stdio : writefln;

    auto morning = TimeOfDay(10, 0);
    auto evening = TimeOfDay(22, 0);
    
    writefln("%s-%s", morning, evening);
}

struct TimeOfDay 
{
    import std.string : format;

    int hour;
    int minute;

    string toString() const pure 
    {
        return format("%02s:%02s", hour, minute);
    }
}
