import std.stdio;
import std.array;

void main()
{
	print("abcçdeé𝔸"c);
	print("abcçdeé𝔸"w);
	print("abcçdeé𝔸"d);
}

void print(T)(T range)
{
	for (; !range.empty; range.popFront())
	{
		write(' ', range.front);
	}

	writeln();
}
