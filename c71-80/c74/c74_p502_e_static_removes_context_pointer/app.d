import std.stdio;

void main()
{
	outerFunc(42);
}

void outerFunc(int parameter)
{
	static class NestedClass
	{
		int i;

		this()
		{
			i = parameter; // ← compilation ERROR
		}
	}
}
