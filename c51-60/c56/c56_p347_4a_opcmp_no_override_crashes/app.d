import std.stdio;
import std.string;
import std.conv;

enum OP_EQUALS = true;
enum OP_CMP    = true;    
enum OP_HASH   = true;

void main()
{
    auto variable0 = new Clock(6, 7, 8);
    auto variable1 = new Clock(6, 7, 8);
    assert(variable0 <= variable1);     // ← Causes exception if opCmp() is not defined
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

    static if (OP_EQUALS)
    {
        override bool opEquals(Object o) const
        {
            auto rhs = cast(const Clock) o; // rhs means right-hand side
            // auto rhs = to!(const Clock)(o);      // alternative syntax


            bool result = rhs && (hour == rhs.hour) && (minute == rhs.minute) && (second == rhs.second);
            return result;
        }
    }

    static if (OP_CMP)
    {  
        override int opCmp(Object o) const {
            Clock rhs = cast(Clock) o;
            if (hour != rhs.hour) return hour - rhs.hour;
            if (minute != rhs.minute) return minute - rhs.minute;
            return second - rhs.second;
        }
    }

    static if (OP_HASH)
    {
        override ulong toHash() const nothrow @trusted
        {
            return (60 * 60 * hour) + (60 * minute) * second;
        }
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

    static if (OP_EQUALS)
    {
        override bool opEquals(Object o) const
        {
            // auto rhs = cast(const AlarmClock) o;     // rhs means right-hand side
            auto rhs = to!(const AlarmClock)(o); // alternative syntax

            bool result = rhs && (alarmHour == rhs.alarmHour) && (alarmMinute == rhs.alarmMinute) && super.opEquals(
                o);
            return result;
        }
    }

    static if (OP_CMP)
    {
        override int opCmp(Object o) const {
            AlarmClock rhs = cast(AlarmClock) o;
            assert(o !is null);
            
            if (hour      != rhs.hour)      return hour   - rhs.hour;
            if (minute    != rhs.minute)    return minute    - rhs.minute;
            if (second    != rhs.second)    return second    - rhs.second;
            if (alarmHour != rhs.alarmHour) return alarmHour - rhs.alarmHour;
            return alarmMinute - rhs.alarmMinute;
        }
    }

    static if (OP_HASH)
    {
        override ulong toHash() const nothrow @trusted
        {
            return ((60 ^^ 4) * hour) + ((60 ^^ 3 * minute) + ((60 ^^ 2) * second)) + (60 * alarmHour) + alarmMinute ;
        }
    }
}
