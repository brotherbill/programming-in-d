import std.stdio  : writeln;
import std.string : format;

void main()
{
	auto noon = new Clock(12, 0, 0);
	writeln(noon);

	string[Clock] timeTags;
	timeTags[noon] = "Noon";

	if (noon in timeTags)
	{
		writeln("noon is in timeTags");
	}
	else
	{
		writeln("noon is NOT in timeTags");
	}

	writeln;

	if (new Clock(12, 0, 0) in timeTags)
	{
		writeln("Exists");
	}
	else
	{
		writeln("Missing");
	}
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
}
