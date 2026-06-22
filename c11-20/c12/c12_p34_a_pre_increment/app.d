import std.stdio;

void main()
{
	int number = 10;
	int value  = ++number;

	writeln("New value:     ", number, ", value after pre-increment: ", value);

	value = --number;
	writeln("New value:     ", number, ", value after pre-decrement: ", value);

	// It is optional to assign the result of the operation to a variable
	int meaning = 43;
	--meaning;
	writeln("meaning of life, the universe and everything: ", meaning);
}
