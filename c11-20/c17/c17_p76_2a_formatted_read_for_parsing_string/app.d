import std.stdio  : write, writeln, readln;
import std.string : strip;
import std.format : formattedRead;

void main()
{
	write("Please enter your name and age," ~ " separated with one or more spaces: ");
	string line = readln().strip();
	string name;
	int    age;

	formattedRead(line, " %s %s", name, age);
	writeln("Your name is ", name, " and your age is ", age, ".");
}
