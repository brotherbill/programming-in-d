void main()
{
	import std.stdio;
	
	writeln("Result: ", add(5, 7));
	writeln("Result: ", 5.add(7));
	writeln("Result: ", 12);
	writeln;

	writeln("Result: ", add(5, divide(100, studentCount)));
	writeln("Result: ", 5.add(100.divide(studentCount)));
	writeln("Result: ", 100.divide(studentCount).add(5));
}

int add(int first, int second)
{
	return first + second;
}

int divide(int numerator, int denominator)
{
	return numerator / denominator;
}

int studentCount()
{
	return 30;
}


