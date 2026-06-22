import std.stdio : writeln, writefln, write;

void main()
{
	double value = 1234.56789;

	writeln("value = ", value);
	writeln;

	writefln("%s: %.8g      %s",  "%.8g", value, "General format with 8 significant digits");
	writefln("%s: %.3g       %s", "%.3g", value, "General format with 3 significant digits");
	writeln;
	
	writefln("%s: %.8f  %s",      "%.8f", value, "Fixed-point format with 8 digits after the decimal point");
	writefln("%s: %.3f       %s", "%.3f", value, "Fixed-point format with 3 digits after the decimal point");
	writeln;

	writeln("With %.*g format, the next parameter specifies the number of significant digits.");
	auto number = 1.23456789;
	writeln("number = ", number);
	write("%.*g  (4): ");
	writefln("%.*g    %s", 4, number, " 4 significant digits");
	writeln;

	writeln("With %.*f format, the next parameter specifies the number of digits after the decimal point.");
	writeln("number = ", number);
	write("%.*f  (3): ");
	writefln("%.*f    %s", 3, number, " 3 digits after the decimal point");
}
