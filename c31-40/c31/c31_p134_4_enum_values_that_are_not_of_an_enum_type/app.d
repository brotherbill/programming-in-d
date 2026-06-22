import std.stdio : writeln, writefln;

void main()
{
	enum      secondsPerDay      = 60 * 60 * 24;
	enum uint uint_secondsPerDay = 60 * 60 * 24;

	int totalDays    = 10;
	int totalSeconds = totalDays * secondsPerDay;
	writefln("totalSeconds %,d: ", totalSeconds);

	enum fileName = "list.txt";
	// fileName ~= " is a file name.";   	// Won't compile.  fileName is immutable as a string literal.
	// writeln("&fileName is ", &fileName);	// Won't compile.  enums have no address.

	immutable fileName_immutable = "list.txt";
	// fileName_immutable ~= " is a file name."; 				// Won't compile.  immutable variables cannot be modified.
	writeln("&fileName_immutable is ", &fileName_immutable);    // Will compile.   immutable variables have an address.
}
