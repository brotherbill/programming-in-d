import std.stdio : writeln;

void main()
{
	int number; 			// a variable
	int otherNumber;		// another variable
	number = otherNumber; 	// copy semantics.  number copies the value of otherNumber

	TimeOfDay time; 		// a struct  (most developers think classes when they see "object")
	TimeOfDay otherTime;	// another struct
	time = otherTime; 		// copy semantics.  time copies the value of otherTime, which includes both the hour and the minute
}

struct TimeOfDay
{
	int hour;
	int minute;
}
