import std.stdio : writeln;

void main()
{
	speedTest1;
	writeln;
	speedTest2;
}

void speedTest1()
{
	int speed; // speed acquires scope here

	foreach (i; 0 .. 10)
	{
		speed = 100 + i;
		writeln("17 speedTest1 i: ", i, ", speed: ", speed);
	}

	writeln("20 speed after: ", speed);
} // speed loses scope here

void speedTest2()
{
	foreach (i; 0 .. 10)
	{
		int speed = 100 + i; // Ten separate variables.
		writeln("28 speedTest2 i: ", i, ", speed: ", speed);
	} // ← Lifetime of each variable ends here.

	// writeln("31 speed: ", speed);	// won't compile.  speed is no longer in scope
}
