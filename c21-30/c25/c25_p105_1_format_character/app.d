import std.stdio : writeln, writefln;

void main()
{
	formatInteger;
	formatDouble;
	formatPercentS;
}

void formatInteger()
{
	int value = 12;

	writeln("We can format the value 12 with various number bases");
	writefln("Binary      %s: %b", "%b", value);
	writefln("Octal       %s: %o", "%o", value);
	writefln("hexadecimal %s: %x", "%x", value); // lowercase a - f
	writefln("Hexadecimal %s: %X", "%X", value); // uppercase A - F
	writefln("Decimal     %s: %d", "%d", value);
	writeln;
}

void formatDouble()
{
	double value = 123.456789;

	writeln("We can format the value 123.456789 in decimal or hexadecimal, and optionally use exponential notation");
	writefln("with %s: %e", "%e Scientific notation                ", value);
	writefln("with %s: %f", "%f Floating point decimal notation    ", value);
	writefln("with %s: %g", "%g General format                     ", value);
	writefln("with %s: %a", "%a Hexadecimal floating point notation", value);
	writeln;
}

void formatPercentS()
{
	import std.stdio : File;
	
	bool   b = true;
	int    i = 365;
	double d = 9.87;
	string s = "formatted";
	auto   o = File("test_file.txt", "r");
	int[]  a = [2, 4, 6, 8];

	writeln("Format with %s");
	writefln("bool   (true)        : %s", b);
	writefln("int    (365)         : %s", i);
 	writefln("double (9.87)        : %s", d);
	writefln("string (\"formatted\") : %s", s);
	writefln("object (File)        : %s", o);
	writefln("array  ([2, 4, 6, 8]): %s", a);
}
