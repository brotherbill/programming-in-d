import std.stdio : writeln, writefln;

void main()
{
	double energy = 100;
	writeln("main Original energy: ", energy);

	reduceEnergy(energy);
	writeln("main Reduced energy : ", energy);
}

void reduceEnergy(double energy)
{
	writeln;
	writefln("reduceEnergy before - energy: %s", energy);

	energy /= 4;

	writefln("reduceEnergy after  - energy: %s", energy);
	writeln;
}
