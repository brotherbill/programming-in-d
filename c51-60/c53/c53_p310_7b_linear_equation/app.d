import std.stdio;

void main()
{
	// This module is one where @disable is used by opCall, forcing us to use braces syntax for construction

	// Won't compile as opCall removes compiler generated automatic constructor
	LinearEquation wontCompile = LinearEquation(1.2, 3.4);  

	// Must use braces syntax to initialize struct members
	LinearEquation equation = { m: 1.2, b: 3.4 };	

	// value of y given y = mx + b, where m = 1.2, b = 3.4 and x = 5.6
	double y = equation(5.6);
	writeln("y: ", y);

	auto linEq2 = LinearEquation.make_m_b(m: 1.2, b: 3.4);
	y = linEq2(5.6);
	writeln("y: ", y);
}

struct LinearEquation
{
	double m;
	double b;

	double opCall(double x) const
	{
		// y = mx + b
		return (m * x) + b;
	}

	static LinearEquation make_m_b(double m, double b)
	{
		LinearEquation result = {m: m, b: b};
		return result;
	}
}
