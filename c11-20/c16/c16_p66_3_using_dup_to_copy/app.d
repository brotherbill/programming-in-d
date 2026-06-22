import std.stdio;

void main() 
{
    int[12] monthDays     = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    int[]   fourthQuarter = monthDays[9 .. $];  	// Slicing to get October, November, December

	int[]   monthDaysCopy     = monthDays.dup;		// Duplicate the original array.  No reference semantics to monthDays
	int[]   fourthQuarterCopy = fourthQuarter.dup;  // Duplicate the slice.           No reference semantics to fourthQuarter

	monthDays[11] = 100;						    // Modifies monthDays[11] and fourthQuarter[2]
	assert(fourthQuarter[2] == 100);

	// Set leap year February days
	monthDaysCopy[1] = 29;
	assert(monthDays[1] == 28);

	// monthDays has original February days, but December has 100 days from line 10
	writeln("monthDays     : ", monthDays, ", length: ", monthDays.length, ", capacity: ", monthDays.capacity);

	// fourthQuarter reflects the change in monthDays from line 10, due to slicing reference semantics	
	writeln("Fourth quarter:                                     ", 
			fourthQuarter, ", length:  ", fourthQuarter.length, ", capacity: ", fourthQuarter.capacity);
	writeln();

	// monthDaysCopy has leap year February days from line 14, but December remains unchanged
	writeln("monthDaysCopy : ", monthDaysCopy, ",  length: ", monthDaysCopy.length, ", capacity: ", monthDaysCopy.capacity);

	// fourthQuarterCopy remains unaffected by changes to monthDays
	writeln("Copy of fourth quarter:                             ",
			fourthQuarterCopy, ",  length:  ", fourthQuarterCopy.length, ", capacity:  ", 
			fourthQuarterCopy.capacity);
}
