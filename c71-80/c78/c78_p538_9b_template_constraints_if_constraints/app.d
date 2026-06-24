import std.stdio;

void main()
{
	int[1] items = [42];
	foo!(int[1])(items);
}

// Short form template
void foo(T)(T items) if (T.length == 1)
{
	writeln("foo(0): ", items[0]);
}
