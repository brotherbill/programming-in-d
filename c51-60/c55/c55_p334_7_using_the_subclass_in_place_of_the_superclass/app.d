import std.stdio  : writeln;
import std.string : format;

void main() 
{
    auto deskClock = new AlarmClock(10, 15, 0, 6, 45);  // time 10:15:00 am, alarm 06:45 am
	writeln("AlarmClock (deskClock) before use: ", deskClock);
	use(deskClock);
    writeln("AlarmClock (deskClock) after  use: ", deskClock);
	writeln;

	auto shelfClock = new BrokenClock;                  // time 00:00:00 am, but after use, it will be some random time of day
    writeln("BrokenClock (shelfClock) before use: ", shelfClock);
	use(shelfClock);
	writeln("BrokenClock (shelfClock) after  use: ", shelfClock);
}

// use is a vanilla function, not a class method
void use(Clock clock) 
{	
	// ...
    // uses dynamic binding of reset.
    // If clock is an AlarmClock, we use AlarmClock's reset method.  
    // If clock is a BrokenClock, we use BrokenClock's reset method.
	clock.reset;
	// ...
}

class Clock 
{
    int hour;
    int minute;
    int second;

    this(int hour, int minute, int second) 
    {
        this.hour   = hour;
        this.minute = minute;
        this.second = second;
    }

    void reset() 
    {
        hour   = 0;
        minute = 0;
        second = 0;
    }

    override string toString() const 
    {
        return format("%02s:%02s:%02s", hour, minute, second);
    }
}

class AlarmClock : Clock 
{
    int alarmHour;
    int alarmMinute;

    this(int hour, int minute, int second, int alarmHour, int alarmMinute) 
    {
        super(hour, minute, second);
        this.alarmHour   = alarmHour;
        this.alarmMinute = alarmMinute;
    }

    override void reset() 
    {
        super.reset();
        alarmHour   = 0;
        alarmMinute = 0;
    }

    override string toString() const 
    {
        return format("time %s alarm %02s:%02s", super.toString(), alarmHour, alarmMinute);
    }
}

class BrokenClock : Clock 
{
    import std.random : uniform;

	this() 
    {
		super(0, 0, 0);		        // Normal initialization
	}

	override void reset() 
    {
		hour   = uniform(0, 24);    // Random hour between 0 and 23
		minute = uniform(0, 60);	// Random minute between 0 and 59
		second = uniform(0, 60);	// Random second between 0 and 59
	}
}
