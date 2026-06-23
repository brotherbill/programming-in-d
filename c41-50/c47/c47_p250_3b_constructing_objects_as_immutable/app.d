void main()
{
	// This is the way to construct an immutable struct
	immutable periodStart    = TimeOfDay(8, 30);
	immutable periodDuration = TimeOfDay(1, 15);

	// This is NOT a way to construct an immutable struct
	immutable TimeOfDay periodStart2;
	periodStart2.hour   =  8; 	// ← compilation ERROR.  Can't mutate an immutable struct.
	periodStart2.minute = 30; 	// ← compilation ERROR.  Can't mutate an immutable struct.
}

struct TimeOfDay
{
	int hour;
	int minute;
}
