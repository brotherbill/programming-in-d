void main() 
{
	import std.stdio : writefln;

	auto morning = TimeOfDay(10, 0);
	auto evening = TimeOfDay(22, 0);
	writefln("%s-%s", morning, evening);
}

struct TimeOfDay 
{
	int hour;
	int minute;

	string toString() const pure {
		return "todo";
	}
}
