import std.stdio;
import std.conv;

void main()
{
	writeln("\n--- these are written in decimal ---");

	// Ends in L, it is long
	// Ends in U, it is unsigned
	// Ends in UL or LU, it is unsigned long
	writeln("42L : ", 42L, "\t\t\t", typeof(42L).stringof);
	writeln("42U : ", 42U, "\t\t\t", typeof(42U).stringof);
	writeln("42UL: ", 42UL, "\t\t\t", typeof(42UL).stringof);

	// fits an int, so the type is int
	writeln("2_147_483_647: ", 2_147_483_647, "\t", typeof(2_147_483_647).stringof);

	// does not fit an int and is decimal digits, so the type is long
	writeln("2_147_483_648: ", 2_147_483_648, "\t", typeof(2_147_483_648).stringof);

	writeln("\n--- these are written in hexadecimal ---");

	// fits an int, so the type is int
	writeln("0x7FFF_FFFF  : ", 0x7FFF_FFFF, "\t", typeof(0x7FFF_FFFF).stringof);

	// does not fit an int and is decimal digits, so the type is uint
	writeln("0x8000_0000  : ", 0x8000_0000, "\t", typeof(0x8000_0000).stringof);

	// does not fit a uint and is decimal digits, so the type is long
	writeln("0x1_0000_0000: ", 0x1_0000_0000, "\t", typeof(0x1_0000_0000).stringof);

	// does not fit a long and is decimal digits, so the type is ulong
	writeln("0x8000_0000_0000_0000: ", 0x8000_0000_0000_0000, "\t", typeof(0x8000_0000_0000_0000).stringof);
	writeln;

	writeln("Fun with binary and octal integers");
	writeln("0b_10_10 = ", 0b_10_10, "\t\t\t", typeof(0b_10_10).stringof); // binary digits
	// octal digits  (not 0o, not starting with 0, but this verbose macro)
	writeln("std.conv.octal!737 = ", std.conv.octal!7_3_7, "\t", typeof(std.conv.octal!7_3_7).stringof); 
}
