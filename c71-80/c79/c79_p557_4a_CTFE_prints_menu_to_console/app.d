import std.stdio;
import std.string;
import std.range;

void main()
{
	// CTFE requires no syntax  
	// You get it for free, if you are disciplined to use compile time variables such as enum
	enum drinks = menu("Drinks", ["Coffee", "Tea", "Hot chocolate"], 20);
	writeln(drinks);
}

string menuLines(string[] choices)
{
	string result;

	foreach (i, choice; choices)
	{
		result ~= format(" %s. %s\n", i + 1, choice);
	}

	return result;
}

string menu(string title, string[] choices, size_t width)
{
	//                                 Drinks      	  horizontal line         menu
	return format("%s\n%s\n%s", title.center(width), '='.repeat(width), menuLines(choices));
}
