import std.stdio;

void main()
{
	alignment;
	plusFlag;
	octalHexForceDecimalPointShowRightmostZeroes;
	leftPaddingZero;
	spaceFormatter;
}

void alignment()
{
	writeln("--- Alignment Examples ---");
	int value = 123;
	string name = "Bob";

	writefln("%s:  Normally right-aligned:|%10d|", "%10d", value);
	writefln("%s:  Normally right-aligned:|%10s|", "%10s", name);
	writefln("%s: Left-aligned          :|%-10d|", "%-10d", value);
	writefln("%s: Left-aligned          :|%-10s|", "%-10s", name);
	writeln;
}

void plusFlag()
{
	writeln("--- Plus Flag Examples ---");
	writefln("%s: No effect for negative values    : |%+d|", "%+d", -50);
	writefln("%s: Positive value with the + flag   : |%+d|", "%+d", 50);
	writeln;

	writefln("%s: Negative value without the + flag: |%d|", "%d", -50);
	writefln("%s: Positive value without the + flag: |%d|", "%d", 50);
	writeln;
}

void octalHexForceDecimalPointShowRightmostZeroes()
{
	writeln("--- Octal, Hex, Decimal Point, Rightmost Zeroes Examples ---");
	writefln("%s: Octal starts with 0                        : %#o", "%#o", 1000);
	writefln("%s: Hexadecimal starts with 0x                 : %#x", "%#x", 1000);
	writefln("%s: Contains decimal mark even when unnecessary: %#g", "%#g", 1f);
	writefln("%s: Rightmost zeros are printed                : %#g", "%#g", 1.2);
	writeln;
}

void leftPaddingZero()
{
	writeln("--- Left Padding with Zero Examples ---");
	writefln("%s: In a field of 8 characters: |%08d|", "%08d", 42);
	writeln;
}

void spaceFormatter()
{
	writeln("--- Space Formatter Examples ---");
	writefln("No effect for negative values: |% d|", -134);
	writefln("Positive value with space    : |% d|", 56);
	writefln("Positive value without space : |%d|", 56);
}
