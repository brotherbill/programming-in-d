void main()
{
	printMenu("Return", 1);
}

void printMenu(string firstEntry, int firstNumber)
{
	import std.stdio : writeln;
	
	writeln(' ', firstNumber + 0, ' ', firstEntry);
	writeln(' ', firstNumber + 1, " Add");
	writeln(' ', firstNumber + 2, " Subtract");
	writeln(' ', firstNumber + 3, " Multiply");
	writeln(' ', firstNumber + 4, " Divide");
}
