import std.stdio : writeln;

void main()
{
	// always false.  Don't use equality to test for NaN.
	if (double.nan == double.nan)
	{
		writeln("equal");
	}
	else
	{
		writeln("not equal");
	}

	import std.math : isNaN;
	
	// using function syntax
	if (isNaN(double.nan))
	{
		writeln("isNaN is true");
	}
	else
	{
		writeln("isNaN is false");
	}

	// using fluent syntax
	if (double.nan.isNaN)
	{
		writeln("isNaN is true");
	}
	else
	{
		writeln("isNaN is false");
	}
}
