import std.stdio : writeln;

void main()
{
	int operation = Operation.add;
	int first     = 100;
	int second    = 20;
	int result 	  = void; // Micro-optimization.  result is not initialized, so has "garbage" value of whatever was in that memory location

	if (operation == Operation.add)
	{
		result = first + second;
	}
	else if (operation == Operation.subtract)
	{
		result = first - second;
	}
	else if (operation == Operation.multiply)
	{
		result = first * second;
	}
	else if (operation == Operation.divide)
	{
		result = first / second;
	}

	writeln("if else operation: ", operation, ", first: ", first, ", second: ", second, ", result: ", result);

	final switch (operation)
	{
	case Operation.add:
		result = first + second;
		break;
	case Operation.subtract:
		result = first - second;
		break;
	case Operation.multiply:
		result = first * second;
		break;
	case Operation.divide:
		result = first / second;
		break;
	}

	writeln("switch  operation: ", operation, ", first: ", first, ", second: ", second, ", result: ", result);
}

enum Operation
{
	add = 1,
	subtract,
	multiply,
	divide
}
