import std.stdio : writeln;

void main()
{
	int dieValue = 5;

	switch (dieValue)
	{
	case 1:
		writeln("You won");
		break;
	case 2, 4:
		writeln("It's a draw");
		break;
	case 3, 5, 6:
		writeln("I lost"); // See: "Heads I win, Tails you lose"
		break;
	default:
		/* The program should never get here because the cases above cover the entire range of valid die values.
 		* (See 'final switch' below.) */
		break;
	}
}
