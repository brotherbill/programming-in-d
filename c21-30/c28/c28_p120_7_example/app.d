import std.stdio : readln, write, writeln, writefln;
import std.string : strip;

void main()
{
	// maps English color names to Turkish color names
	immutable string[string] colors = [
		"black": "siyah",
		"white": "beyaz",
		"red": "kırmızı",
		"green": "yeşil",
		"blue": "mavi"
	];

	writefln("I know the Turkish names of these %s colors: %s", colors.length, colors.keys);
	write("Please ask me one: ");
	string inEnglish = readln.strip;

	if (inEnglish in colors)
	{
		writefln("\"%s\" is \"%s\" in Turkish.", inEnglish, colors[inEnglish]);
	}
	else
	{
		writeln("I don't know that one.");
	}
}
