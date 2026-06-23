import std.stdio : writeln;
import std.string : format;

void main() 
{
	bool aCondition = true;

	if (aCondition) 
	{
		auto duration = Duration(7, 30, 15);
		writeln("Duration is: ", duration);
	}	// ← The destructor is executed for 'duration' at this point as duration goes out of scope.
}

struct Duration
{
	int hours;
	int minutes;
	int seconds;

	this(in int h, in int m, in int s)
	{
		writeln("Creating Duration: ", h, ":", m, ":", s);
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
