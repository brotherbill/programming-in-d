import std.stdio;

void main()
{
	int meaningOfLife = 42;
	double pi = 3.14159;
	string greeting = "Greetings, D!";
	int[] slice = [1, 2, 3, 4, 5];

	printBytes(meaningOfLife); // int
	printBytes(pi); // double
	printBytes(greeting); // string

	printBytes(slice); // array

	struct Point
	{
		int x;
		int y;
	}

	Point p = Point(10, 20);
	printBytes(p); // struct
}

void printBytes(T)(ref T variable)
{
	const ubyte* begin = cast(ubyte*)&variable; // (1)
	writefln("type   : %s", T.stringof);
	writefln("value  : %s", variable);
	writefln("address: %s", begin); // (2)
	writef("bytes  : ");
	writefln("%(%02x %)", begin[0 .. T.sizeof]); // (3)
	writeln;
}
