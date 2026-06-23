import std.stdio  : writeln;
import std.string : format;

void main()
{
    immutable warmUpTime = Duration(3);

    totalSeconds(/* ref */ warmUpTime); // ← compilation ERROR. Can't pass immutable as ref.
}

/* Although not being modified by the function, 'duration' is not marked as 'const' */
int totalSeconds(ref Duration duration)
{
    return 60 * duration.minute;
}

struct Duration
{
    int hour;
    int minute;

    string toString() const
    { // must have const or inout here
        return format("%02s:%02s", hour, minute);
    }
}
