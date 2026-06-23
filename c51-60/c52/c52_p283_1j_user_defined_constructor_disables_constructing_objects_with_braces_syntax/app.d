import std.stdio : writeln;

void main()
{
    auto time = TimeOfDay(15, 30);
    writeln("3:30 pm is ", time);

    time.decrement(Duration(12));
    writeln("12 minutes before 3:30pm is ", time);

    // Duration duration = {5}; // ← compilation ERROR. Can't use braces initializer as Duration has an explicit constructor.

    // Default initialization of Duration. 
    // The default constructor is implicitly defined by the compiler and initializes all fields to their default values (0 for int).
    auto d = Duration();
    assert(d == Duration.init);
    assert(d.minute == 0);
}

struct Duration
{
    int minute;

    this(int minute)
    {
        this.minute = minute;
    }

    this(int hour, int minute)
    {
        this.minute = hour * 60 + minute;
    }
}

struct TimeOfDay
{
    int hour;
    int minute;

    string toString() const
    {
        import std.string : format;

        return format("%02s:%02s", hour, minute);
    }

    void toMinutes()
    {
        minute += hour * 60;
        hour = 0;
    }

    void normalize()
	out(; (0 <= hour && hour < 24) && (0 <= minute && minute < 60))
    do
	{
		while (hour < 0)
		{
			hour += 24;
		}

		while (minute < 0)
		{
			minute += 60 * 24;
		}
			
		hour  += minute / 60;
		minute = minute % 60;
		hour  %= 24;
	}

    void decrement(Duration duration)
    {
        this.toMinutes;
        this.minute -= duration.minute;
        this.normalize;
    }
}
