import std.stdio;

void main()
{
	import core.stdc.math : isnan;

	double zero     = 0;
	double infinity = double.infinity;

	writeln("any expression with nan: ", double.nan + 1);
	writeln("zero / zero            : ", zero / zero);
	writeln("isnan(zero / zero)     : ", isnan(zero / zero));
	writeln("isnan(zero)            : ", isnan(zero));
	writeln();
	writeln("zero * infinity        : ", zero * infinity);
	writeln("infinity / infinity    : ", infinity / infinity);
	writeln("infinity - infinity    : ", infinity - infinity);
}
