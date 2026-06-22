import std.stdio : writeln;

void main()
{
	int dieValue = 5;

	switch (dieValue)
	{
	case 1:
		writeln("You won");
		break;
	case 2: .. case 5: // Range of values is inclusive, unlike D Ranges
		writeln("It's a draw");
		break;
	case 6:
		writeln("I lost"); // See: "Heads I win, Tails you lose" where a hustler always wins on a coin toss
		break;
	default:
		/* The program should never get here because the cases above cover the entire range of valid die values.
 		* (See 'final switch' below.) */
		break;
	}
}
