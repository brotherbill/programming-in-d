import std.stdio;

void main()
{
	printElements("abcçdeé𝔸"c);
	printElements("abcçdeé𝔸"w);
	printElements("abcçdeé𝔸"d);
}

void printElements(T)(T str)
{
	for (int i = 0; i != str.length; ++i)
	{
		write(' ', str[i]);
	}
	writeln();
}
