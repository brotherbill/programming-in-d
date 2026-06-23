import std.stdio : writefln;

void main()
{
	auto duration = Duration(100); // construction
	duration      = Duration(200); // construction and then assignment
	
	auto duration2 = Duration(300); // construction
	duration       = duration2;     // assignment only, no construction

	writefln("duration.minute  = %s", duration.minute);  // 300
	writefln("duration2.minute = %s", duration2.minute); // 300
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
}
