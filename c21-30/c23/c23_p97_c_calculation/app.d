import std.stdio;

void main()
{
	bool isGammon = true;
	int score;

	// technique 1: ternary operator
	score += isGammon ? 2 : 1;

	// technique 2: if else
	if (isGammon)
	{
		score += 2;
	}
	else
	{
		score += 1;
	}

	// technique 3: increment for win, increment for gammon
	++score;

	if (isGammon)
	{
		++score;
	}

	writeln("score: ", score);
}
