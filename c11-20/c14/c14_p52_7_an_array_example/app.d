import std.stdio;

void main()
{
	// This variable is used as a loop counter
	int counter;

	// The definition of a fixed-length array of five elements of type double
	double[5] values;

	// Reading the values in a loop.  User enters five values.
	while (counter < values.length)
	{
		write("Value ", counter + 1, ": ");
		readf(" %s", &values[counter]);
		++counter;
	}
	writeln();

	// Writing twice the values using different loop constructs
	// classic while loop
	writeln("Twice the values with while loop:");
	counter = 0;
	while (counter < values.length)
	{
		writeln(values[counter] * 2);
		++counter;
	}
	writeln();

	// classic for loop
	writeln("Twice the values with for loop:");
	for (counter = 0; counter < values.length; ++counter)
	{
		writeln(values[counter] * 2);
	}
	writeln();

	// foreach loop
	writeln("Twice the values with foreach loop:");
	foreach (value; values)
	{
		writeln(value * 2);
	}
}
