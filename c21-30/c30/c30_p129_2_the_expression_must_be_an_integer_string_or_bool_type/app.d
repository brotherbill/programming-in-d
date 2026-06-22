import std.stdio : writeln;
import std.format : format;

void main()
{
	string op  = "multiply";
	int first  = 100;
	int second = 20;
	int result;

	switch (op)
	{
	case "add":
		result = first + second;
		break;
	case "subtract":
		result = first - second;
		break;
	case "multiply":
		result = first * second;
		break;
	case "divide":
		result = first / second;
		break;
	default:
		throw new Exception(format("Unknown operation: %s", op));
	}

	writeln("op: ", op, ", first: ", first, ", second: ", second, ", result = ", result);

    bool is_raining = false;

    final switch (is_raining)
    {
    case false: writeln("It's raining");
    case true:  writeln("It's not raining");
    }
}