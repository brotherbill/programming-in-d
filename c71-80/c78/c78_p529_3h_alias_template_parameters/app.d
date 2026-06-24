import std.stdio;

void main()
{
	int x = 1;
	int y = 2;
	auto object = MyStruct!x();

	object.set(10);
	writeln("x: ", x, ", y: ", y);
	writeln;

	x = 1;
	y = 2;
	auto object2 = MyStruct!y();

	object2.set(10);
	writeln("x: ", x, ", y: ", y);
}

struct MyStruct(alias variable)
{
	void set(int value)
	{
		variable = value;
	}
}
