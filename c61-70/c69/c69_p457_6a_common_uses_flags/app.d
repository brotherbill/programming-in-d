import std.stdio;

void main()
{
	Realism flags = Realism.tireUse | Realism.skidMarks;
	writefln("%b", flags);

	if (flags & Realism.fuelUse)
	{
		writeln("Fuel use enabled");
	}
	else
	{
		writeln("Fuel use disabled");
	}

	if (flags & Realism.tireUse)
	{
		writeln("Tire use enabled");
	}
	else
	{
		writeln("Tire use disabled");
	}
}

enum Realism
{
	fuelUse = 1 << 0,
	bodyDamage = 1 << 1,
	tireUse = 1 << 2,
	skidMarks = 1 << 3
}
