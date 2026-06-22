import std.stdio;

void main()
{
	int[12] monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

	// if int[] then is a slice.  if int[3] then is NOT a slice, but a fixed-size array
	int[3] firstQuarter  = monthDays[0 .. 3];		// firstQuarter is NOT a slice, but a fixed-size array, with copy semantics
	int[]  secondQuarter = monthDays[3 .. 6];		// secondQuarter is a slice with reference semantics
	int[]  thirdQuarter  = monthDays[6 .. 9];		// thirdQuarter  is a slice with reference semantics
	int[]  fourthQuarter = monthDays[9 .. 12];		// fourthQuarter is a slice with reference semantics
	int[]  emptySlice    = fourthQuarter[1 .. 1];   // emptySlice is a slice of length 0

	writeln("First  Quarter: ", firstQuarter, ", length: ", firstQuarter.length, ", capacity: ", firstQuarter.capacity, ", type: ",  typeof(firstQuarter).stringof);
	writeln("Second Quarter: ", secondQuarter, ", length: ", secondQuarter.length, ", capacity: ", secondQuarter.capacity, ", type: ", typeof(secondQuarter).stringof);
	writeln("Third  Quarter: ", thirdQuarter, ", length: ", thirdQuarter.length, ", capacity: ", thirdQuarter.capacity, ", type: ",  typeof(thirdQuarter).stringof);
	writeln("Fourth Quarter: ", fourthQuarter, ", length: ", fourthQuarter.length, ", capacity: ", fourthQuarter.capacity, ", type: ", typeof(fourthQuarter).stringof);
	writeln();

	firstQuarter [0] = 1;	// Modifying firstQuarter does NOT affect monthDays
	secondQuarter[0] = 2;	// Modifying secondQuarter affects monthDays[3]
	thirdQuarter [0] = 3;   // Modifying thirdQuarter  affects monthDays[6]
	fourthQuarter[0] = 4;   // Modifying fourthQuarter affects monthDays[9]

	monthDays[11] = 999;    // Modifying monthDays affects fourthQuarter[3]

	writeln("monthDays     : ", monthDays, ", length: ", monthDays.length, ", capacity: ", monthDays.capacity, ", type: ", typeof(monthDays).stringof);
	writeln("First  Quarter: ", firstQuarter, ",  length: ", firstQuarter.length, ", capacity: ", firstQuarter.capacity, ", type: ",  typeof(firstQuarter).stringof);
	writeln("Second Quarter: ", secondQuarter, ",  length: ", secondQuarter.length, ", capacity: ", secondQuarter.capacity, ", type: ", typeof(secondQuarter).stringof);
	writeln("Third  Quarter: ", thirdQuarter, ",  length: ", thirdQuarter.length, ", capacity: ", thirdQuarter.capacity, ", type: ",  typeof(thirdQuarter).stringof);
	writeln("Fourth Quarter: ", fourthQuarter, ", length: ", fourthQuarter.length, ", capacity: ", fourthQuarter.capacity, ", type: ", typeof(fourthQuarter).stringof);
	writeln();

	writeln("Empty Slice: ", emptySlice, ", length: ", emptySlice.length, ", capacity: ", emptySlice.capacity, ", type: ", typeof(emptySlice).stringof);
	writeln();

	// Note that monthDays[0] is unaffected by the change to firstQuarter[0]
	// This is because firstQuarter is a fixed-size array, not a slice
	writeln("monthDays: ", monthDays);
}
