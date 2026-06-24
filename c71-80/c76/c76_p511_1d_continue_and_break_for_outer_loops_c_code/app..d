import std.stdio;

void main()
{
	// Change these to other values to explore the code
	bool condition = true;
	bool otherCondition = true;
	int i = 1;

	// --- C code --
	while (condition)
	{
		while (otherCondition)
		{
			// affects the inner loop
			if (i == 1)
			{
				writeln("i is 1");
				++i;
				continue;
			}

			// affects the inner loop
			if (i == 2)
			{
				writeln("i is 2");
				++i;
				break;
			}

			// works like 'continue' for the outer loop
			if (i == 3)
			{
				writeln("i is 3");
				++i;
				goto continueOuter;
			}

			// works like 'break' for the outer loop
			if (i == 4)
			{
				writeln("i is 4");
				++i;
				goto breakOuter;
			}

			if (i > 4)
			{
				writeln("i is 5");
				condition = false;
				otherCondition = false;
				return;
			}
		}

		writeln("while i is ", i);

	continueOuter:
		writeln("continueOuter i is ", i);
	}

breakOuter:
	writeln("breakOuter: ", i);
}
