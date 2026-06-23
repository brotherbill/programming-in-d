import std.stdio : writeln;

void main()
{
	// This struct contains its own hour and minute member variables.
	TimeOfDay bedTime;

	// This struct contains its own hour and minute member variables as well.
	// The member variables of this struct are not related to the member variables of the previous object.
	TimeOfDay wakeUpTime;
}

struct TimeOfDay
{
	// hour and minute are member variables of the TimeOfDay struct.  Also called fields.
	int hour; 	// ← Not a variable; will become a part of a struct variable used in the program.
	int minute; // ← Not a variable; will become a part of a struct variable used in the program.
}
