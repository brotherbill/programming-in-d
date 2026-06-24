import std.stdio;

void main()
{
	int[3] myArray = [10, 20, 30];

	print(myArray);
}

void print(const int[] array)
{
	for (int i = 0; i != array.length; ++i)
	{
		write(' ', array[i]);
	}
	writeln;
}
