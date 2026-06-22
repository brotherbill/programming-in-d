import std.stdio;

void main()
{
	int    inky;
	float  fast;
	double dinky;
	real   racing;

	writeln("int stringof = ", inky.stringof);
	writeln("int size = ", inky.sizeof);
	writeln();

	writeln("fast = ", fast, " and dinky = ", dinky, " and racing = ", racing);
	writeln("fast.stringof = ", fast.stringof, " and dinky.stringof = ", dinky.stringof, " and racing.stringof = ", racing.stringof);
	writeln("float size = ", fast.sizeof, " and double size = ", dinky.sizeof, " and real size = ", racing.sizeof);
	writeln("float max = ", fast.max, " and double max = ", dinky.max, " and real max = ", racing.max);
	writeln("float min_normal = ", fast.min_normal, " and double min_normal = ", dinky.min_normal, 
			" and real min_normal = ", racing.min_normal);
	writeln("float dig = ", float.dig, " and double dig = ", double.dig, " and real dig = ", real.dig);
	writeln("float infinity = ", float.infinity, " and double infinity = ", double.infinity, " and real infinity = ", real.infinity);
}
