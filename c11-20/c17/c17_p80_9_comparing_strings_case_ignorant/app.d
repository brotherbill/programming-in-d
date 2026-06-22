import std.stdio  : readln, write, writeln;
import std.string : strip, icmp;

void main()
{
	write("      Enter a string: ");
	string s1 = strip(readln);

	write("Enter another string: ");
	string s2 = strip(readln);

	int comparison = icmp(s1, s2);
	// If comparison is negative, s1 < s2
	// If comparison is zero, s1 == s2
	// If comparison is positive, s1 > s2
	writeln("Comparison result: ", comparison);

	if (comparison == 0)
	{
		writeln("They are equal! (case-insensitive)");
	}
	else if (comparison < 0)
	{
		writeln("'", s1, "' comes before '", s2, "'. (case-insensitive)");
	}
	else
	{
		writeln("'", s2, "' comes before '", s1, "'. (case-insensitive)");
	}
}
