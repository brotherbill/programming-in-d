import std.stdio : writeln;

void main()
{
	writeln("--- CHARACTER LITERALS ---");
	writeln("Variable\t\tChar\tType");
	writeln("====================================");
	auto d = 'd';
	writeln(d.stringof, "\t\t\t", d, "\t", typeof(d).stringof);

	char capitalD_hexadecimal = '\x44';
	writeln(capitalD_hexadecimal.stringof, "\t", capitalD_hexadecimal, "\t", typeof(capitalD_hexadecimal).stringof);

	char capitalD_octal = '\104';
	writeln(capitalD_octal.stringof, "\t\t", capitalD_octal, "\t", typeof(capitalD_octal).stringof);
	writeln;

	writeln("--- UNICODE ---");
	wchar g1 = '\u011e';
	writeln(g1.stringof, "\t\t\t", g1, "\t", typeof(g1).stringof);

	dchar g2 = '\U0000011e';
	writeln(g2.stringof, "\t\t\t", g2, "\t", typeof(g2).stringof);
	writeln;

	writeln("--- HTML CHARACTER ---");
	auto copyright = '\&copy;';
	writeln(copyright.stringof, "\t\t", copyright, "\t", typeof(copyright).stringof);
}
