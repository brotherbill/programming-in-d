import std.stdio;

void main()
{
	int a = 1;
	int b = 2;
	int result = greater(a, b);

	result += 10; // ← neither a nor b changes
	writefln("a: %s, b: %s, result: %s", a, b, result);
}

int greater(int first, int second)
{
	return (first > second) ? first : second;
}
