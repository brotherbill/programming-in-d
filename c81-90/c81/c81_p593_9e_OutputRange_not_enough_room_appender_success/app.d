import std.stdio;
import std.range : appender;

void main()
{
	int[] slice = [1, 2, 3];
	int[] slice2 = slice;

	writeln("slice2 before: ", slice2);
	writeln("slice  before: ", slice);

	auto a = appender([1, 2, 3]);
	writeln("a      before: ", a.data);
	writeln;

	foreach (i; 0 .. 4)
	{
		a.put(i * 100);
	}

	a ~= 1000;

	writeln("slice2 after : ", slice2);
	writeln("slice  after : ", slice);
	writeln("a      after : ", a.data);
}
