import std.stdio;

void main()
{
	// auto deskClock1 = new Clock(3, 15, 59);	// Won't compile without explicit constructor
	auto deskClock2 = new Clock; // Default parameterless constructor
	deskClock2.adjust(3, 15, 59); // Manually set member values

	writefln("%02s:%02s:%02s", deskClock2.hour, deskClock2.minute, deskClock2.second);
}

class Clock
{
	int hour;
	int minute;
	int second;

	void adjust(int hour, int minute, int second = 0)
	{
		this.hour = hour;
		this.minute = minute;
		this.second = second;
	}
}
