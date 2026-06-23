import std.stdio : writeln;
import std.string : format;

void main() 
{
	bool aCondition = true;

	if (aCondition) 
	{
		Time time = Time(10, 30, 45);
		writeln("Initial time is: ", time);

		// Duration object created here is temporary and will be destroyed after this line.
		writeln("=== Before time.increment ===");
		time.increment(Duration(1, 45, 30));
		writeln("=== After  time.increment ===");
		writeln("Time after increment is: ", time);

	}	// ← time's destructor is executed for 'time' at this point as time goes out of scope.
}

struct Duration
{
	int hours;
	int minutes;
	int seconds;

	this(in int h, in int m, in int s)
	{
		writeln("Creating   Duration: ", h, ":", m, ":", s);
		hours   = h;
		minutes = m;
		seconds = s;
	}

	~this() 
	{
		writeln("Destroying Duration: ", hours, ":", minutes, ":", seconds);
	}

	string toString() const
	{
		return format("%02d:%02d:%02d", hours, minutes, seconds);
	}
}

struct Time
{
 	int hours;
	int minutes;
	int seconds;

	this(in int h, in int m, in int s)
	{
		hours   = h;
		minutes = m;
		seconds = s;
	}

	~this() 
	{
		writeln("Destroying Time: ", hours, ":", minutes, ":", seconds);
	}

	string toString() const
	{
		return format("%02d:%02d:%02d", hours, minutes, seconds);
	}

	void increment(in Duration duration)
	{
		seconds += duration.seconds;
		minutes += duration.minutes + seconds / 60;
		hours   += duration.hours   + minutes / 60;


		seconds = seconds % 60;
		minutes = minutes % 60;
		hours   = hours   % 24;
	}	
}
