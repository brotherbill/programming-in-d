import std.stdio  : write, writeln, readln;
import std.string : strip;
import std.format : formattedRead;

void main()
{
	write("Please enter your name and age," ~ " separated with a space: ");
	string line = readln().strip();
	string name;
	string occupation;
	int    age;

	// It will attempt to read two items: name and age.
	// Once it reads them, it will stop, even if there are more items.
	uint items = formattedRead(line, " %s %s", name, age);
	
	writeln("You entered: ", items, " items.");
	if (items == 2)
	{
		writeln("Your name is ", name, " and your age is ", age, ".");
	}
	else
	{
		writeln("Invalid input. Please enter your name followed by your age.");
	}

	// Cheating: I know third item is occupation, so I will read it directly
	items = formattedRead(line, " %s", occupation);
	writeln("You entered an occupation: ", occupation, ", items: ", items);
}
