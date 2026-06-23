import std.stdio  : writeln;
import std.string : format;

void main()
{
    immutable warmUpTime = Duration(3);

    totalSeconds(warmUpTime);  
    totalSeconds2(warmUpTime);
}

// const ref means that the parameter is not modified shallow or deep by the function
int totalSeconds(const ref Duration duration)
{
    duration.minute = 7;		// ← compilation ERROR, because of const
    return 60 * duration.minute;
}

// in ref means that the parameter is not modified shallow or deep by the function
int totalSeconds2(in ref Duration duration)
{
    duration.minute = 7;		// ← compilation ERROR, because of in
    return 60 * duration.minute;
}

struct Duration
{
    int hour;
    int minute;

    // must have const or inout here
    string toString() const
    { 
        return format("%02s:%02s", hour, minute);
    }
}
