import std.stdio;

void main()
{
	static if (is(int))
	{
		writeln("int is a valid type");
	}
	else
	{
		writeln("int is not a valid type");
	}

	static if (is(string[void]))
	{
		writeln("string[void] is a valid type");
	}
	else
	{
		writeln("string[void] is not a valid type");
	}

	static if (is(MyStruct))
	{
		writeln("MyStruct is a valid type");
	}
	else
	{
		writeln("MyStruct is not a valid type");
	}

	static if (is(YourStruct))
	{
		writeln("YourStruct is a valid type");
	}
	else
	{
		writeln("YourStruct is not a valid type");
	}

	static if (is(void))
	{
		writeln("void is a valid type");
	}
	else
	{
		writeln("void is not a valid type");
	}

}

struct MyStruct
{
	int a;
	float b;
}
