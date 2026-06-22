import std.stdio : writeln;

void main()
{
	int[string] dayNumbers;

	// associates value 0 with key "Monday"
	dayNumbers["Monday"] = 0;

	// associates value 1 with key "Tuesday"
	dayNumbers["Tuesday"] = 1;

	writeln("dayNumbers - not stored sequentially");
	writeln(dayNumbers);
	writeln;

	writeln("Let's replace the value for Tuesday");
	dayNumbers["Tuesday"] = 222;
	writeln(dayNumbers);
}
