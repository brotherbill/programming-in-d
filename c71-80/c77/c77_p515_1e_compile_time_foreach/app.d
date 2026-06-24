import std.stdio;
import std.typecons;
import std.conv;
import std.string;

void main()
{
	auto t = tuple(42, "hello", 1.5);

	foreach (i, member; t)
	{
		writefln("%s: %s", i, member);
	}
	writeln;

	// This works for run-time also
	auto b = Tuple!(int, "number", string, "fruitName")(someNumber(), someFruit);
	foreach (i, fruit; b)
	{
		writefln("%s: %s", i, fruit);
	}
}

int someNumber()
{
	writeln("Enter a number: ");
	string input = readln;
	input = strip(input);
	int number = input.to!int;
	writeln("number: ", number);
	return number;
}

string someFruit()
{
	writeln("Enter favorite fruit: ");
	string fruit = readln;
	fruit = strip(fruit);
	writeln("fruit: ", fruit);
	return fruit;
}
