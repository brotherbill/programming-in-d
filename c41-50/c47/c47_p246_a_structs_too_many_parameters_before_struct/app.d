import std.stdio : writeln;

void main()
{
	int hour;
	int minute;

	addDuration(             15,               30, 	// startHour,    startMinute
	                          1,               15, 	// durationHour, durationMinute
				 /* out */ hour, /* out */ minute);	// resultHour,   resultMinute

	writeln("3:30 pm + 1:15 duration meeting ends at: ", hour, ":", minute);
}

void addDuration(    int startHour,        int startMinute, 	// starting time
 				     int durationHour,     int durationMinute, 	// duration
				 out int resultHour,   out int resultMinute)	// result 
{
	resultHour    = startHour    + durationHour;
	resultMinute  = startMinute  + durationMinute;
	resultHour   += resultMinute / 60;
	resultMinute %= 60;
	resultHour   %= 24;
}
