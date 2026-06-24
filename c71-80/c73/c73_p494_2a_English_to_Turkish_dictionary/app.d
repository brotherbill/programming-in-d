import std.stdio;

string[string] dictionary;

void main()
{
	dictionary["One"] = "Bir";
	dictionary["Two"] = "Iki";
	dictionary["Three"] = "uc";

	writeln("Only values");
	foreach (inTurkish; dictionary)
	{
		writeln(inTurkish);
	}
	writeln;

	writeln("Keys and values");
	foreach (inEnglish, inTurkish; dictionary)
	{
		writeln(inEnglish, " => ", inTurkish);
	}
}
