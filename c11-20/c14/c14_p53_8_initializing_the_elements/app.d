import std.stdio;

void main()
{
	// Assuming that February has 28 days
	int[12] monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

	// Note: No input validation is performed
	write("Enter the number of the month (1 - 12): ");
	int monthNumber;
	readf(" %s", &monthNumber);

	int index = monthNumber - 1;
	writeln("Month ", monthNumber, " has ", monthDays[index], " days.");
}
