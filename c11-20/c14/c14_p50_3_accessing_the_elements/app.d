import std.stdio;

void main()
{
	// This is a definition. It defines an array that consists of 12 elements. 
	// This array is used to hold the number of days in each month.
	// The array indexes correspond to the months of the year, starting from 0 for January to 11 for December.
	int[12] monthDays;

	// An alternative way is to create an array of 13 elements and ignore the 0th element.
	// This way, the index corresponds directly to the month number (1 for January, 2 for February, ..., 12 for December).
	// This is rarely used, but shown here for demonstration purposes.
	// The reason it's rarely used is that it wastes one element of the array and other developers aren't expecting it.
	// Best practice is to use the first method shown above.
	int[13] monthDays12; 
	monthDays12[1] = 31; // January
	monthDays12[2] = 28; // February
	// ... and so on for other months

	writeln("February has ", monthDays12[2], " days.");
	writeln();

	// This is an access. It accesses an element that corresponds to a month and sets its value to 31
	monthDays[0]  = 31; // January
	monthDays[1]  = 28; // February
	monthDays[2]  = 31; // March
	monthDays[3]  = 30; // April
	monthDays[4]  = 31; // May
	monthDays[5]  = 30; // June
	monthDays[6]  = 31; // July
	monthDays[7]  = 31; // August
	monthDays[8]  = 30; // September
	monthDays[9]  = 31; // October
	monthDays[10] = 30; // November
	monthDays[11] = 31; // December

	// This is another access. It accesses the element that corresponds to January, the value of which is passed to writeln.
	writeln("January   has ", monthDays[0],  " days.");
	writeln("February  has ", monthDays[1],  " days.");
	writeln("March     has ", monthDays[2],  " days.");
	writeln("April     has ", monthDays[3],  " days.");
	writeln("May       has ", monthDays[4],  " days.");
	writeln("June      has ", monthDays[5],  " days.");
	writeln("July      has ", monthDays[6],  " days.");
	writeln("August    has ", monthDays[7],  " days.");
	writeln("September has ", monthDays[8],  " days.");
	writeln("October   has ", monthDays[9],  " days.");
	writeln("November  has ", monthDays[10], " days.");
	writeln("December  has ", monthDays[11], " days.");
}
