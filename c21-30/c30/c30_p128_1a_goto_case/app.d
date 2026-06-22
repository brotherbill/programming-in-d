import std.stdio : writeln;

void main()
{
	int value = 5;

	switch (value)
	{
	case 5:
		writeln("five");
		goto case; 	// drops down into the next case
	case 4:
		writeln("four");
		goto done;	// jumps to the done label
	default:
		writeln("unknown");
		break;
	}

	writeln("Switch completed");

done:
	writeln("Done");
}
