import std.stdio : writeln;

void main()
{
	// multiplication done at compile time, not run time
	int numberOfSecondsInJanuary = 60 * 60 * 24 * 31;
	writeln(numberOfSecondsInJanuary.stringof, ": ", numberOfSecondsInJanuary);

	// concatenation done at compile time, not run time
	string greetings = "Greetings" ~ " " ~ "world" ~ "!";
	writeln(greetings.stringof, ": ", greetings);
}
