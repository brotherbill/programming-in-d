import std.stdio : writeln;

void main()
{
	for (int i = 0; i < 5; ++i)
	{
		writeln("i: ", i);
	}

	// writeln(i); 	// ← compilation ERROR
	//                   i is not accessible here	

	writeln;

	int j = 0;
	while (j < 5)
	{
		writeln("j: ", j);
		++j;
	}
	writeln("final j: ", j);
}
