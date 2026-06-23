import std.stdio : writeln;
import std.format : format;

void main()
{
	string operator = "%";
	int first = 100;
	int second = 30;

	switch (operator)
	{
	case "+":
		writeln(first + second);
		break;
	case "-":
		writeln(first - second);
		break;
	case "x":
		writeln(first * second);
		break;
	case "/":
		writeln(first / second);
		break;
	default:
		throw new Exception(format("Invalid operator: %s", operator));
	}
}
