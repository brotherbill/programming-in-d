import std.stdio;

void main()
{
	auto      m = S(1);
	const     c = S(2);
	immutable i = S(3);
	shared    s = S(4);
	writeln;

	auto      m2 =           S(10);
	const     c2 = const     S(20);
	immutable i2 = immutable S(30);
	shared    s2 = shared    S(40);
}

struct S
{
 	          int   i;
	immutable int[] slice;

	this(int i)
	{
		writeln("Constructing a  mutable object");
		this.i = i;

		int[] items = [];
		foreach (item; 1 .. i + 1)
		{
			items ~= item;
		}
		this.slice = cast(immutable(int[])) items;
	}

	this(int i) const
	{
		writeln("Constructing a  const object");
		this.i = i;

		int[] items = [];
		foreach (item; 1 .. i + 1)
		{
			items ~= item;
		}
		this.slice = cast(immutable(int[])) items;
	}

	this(int i) immutable
	{
		writeln("Constructing an immutable object");
		this.i = i;

		int[] items = [];
		foreach (item; 1 .. i + 1)
		{
			items ~= item;
		}
		this.slice = cast(immutable(int[])) items;
	}

	// We will see the 'shared' keyword in a later chapter.
	this(int i) shared
	{
		writeln("Constructing a  shared object");
		this.i = i;

		int[] items = [];
		foreach (item; 1 .. i + 1)
		{
			items ~= item;
		}
		this.slice = cast(immutable(int[])) items;
	}
}
