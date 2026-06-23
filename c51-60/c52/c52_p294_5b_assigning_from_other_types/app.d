import std.stdio : writefln;

void main()
{
	Duration duration = Duration(200); 	// construction only
	duration          = 300; 			// assignment
}

struct Duration
{
	int minute;

	typeof(this) opAssign(typeof(this) rhs)
	{
		writefln("minute is being changed from %s to %s", this.minute, rhs.minute);

		this.minute = rhs.minute;

		return this;
	}

	typeof(this) opAssign(int minute)
	{
		writefln("minute is being replaced by an int");

		this.minute = minute;

		return this;
	}
}
