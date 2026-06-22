import std.stdio : write, writeln;

void main()
{
	writeln("Dice Game");

	foreach (dieValue; 1 .. 8)
	{
		write(dieValue, ": ");

		// If dieValue is not in the range 1 to 6 inclusive, the switch statement will throw an error at run time
		final switch (dieValue)
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

		// No default section permitted if `final switch`
		// default:
		// 	writeln("This won't compile!");
		// 	break;

		// case ranges not allowed in `final switch`
		// case 7: .. case 12:
		// 	writeln("dieValue is between 7 and 12, inclusive");
		// 	break;
		}
	}
}
