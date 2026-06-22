import std.stdio : writeln;

void main()
{
	int operation = 3;		// 1: add, 2: subtract, 3: multiply, 4: divide
	int first     = 100;
	int second    = 20;
	int result    = void; 	// Micro-optimization.  result is not initialized, so has "garbage" value of whatever was in that memory location

	if (operation == 1)
	{
		result = first + second;
	}
	else if (operation == 2)
	{
		result = first - second;
	}
	else if (operation == 3)
	{
		result = first * second;
	}
	else if (operation == 4)
	{
		result = first / second;
	}

	writeln("operation: ", operation, ", first: ", first, ", second: ", second, ", result: ", result);
}
