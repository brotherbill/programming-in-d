import std.stdio : writeln;

void main()
{
	auto      m = S(1);
	const     c = S(2);
	immutable i = S(3);
	shared    s = S(4);
}

struct S
{
	          int   i;
	immutable int[] slice;

	this(int i)
	{
		writeln("Constructing an object");
		this.i = i;

		int[] items = [];
		foreach (item; 1 .. i + 1) {
			items ~= item;
		}
		this.slice = cast(immutable(int[]))items;
		writeln("Constructed an object with slice: ", i, ", ", this.slice);
		writeln;
	}
}
