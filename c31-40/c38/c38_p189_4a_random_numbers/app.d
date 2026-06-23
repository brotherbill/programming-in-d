import std.stdio  : writeln, write;
import std.getopt : getopt;
import std.random : uniform;

void main(string[] args)
{
	int count;
	int minimum;
	int maximum;

	getopt(args,
		"count",   &count,
		"minimum", &minimum,
		"maximum", &maximum);

	foreach (i; 0 .. count)
	{
		write(uniform(minimum, maximum + 1), ' ');
	}

	writeln();
}
