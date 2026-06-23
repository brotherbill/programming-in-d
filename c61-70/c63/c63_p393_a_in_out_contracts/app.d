import std.stdio;
private import std.math;

void main()
{
	double triArea1 = triangleArea(3, 4, 5);
	writeln("triArea1: ", triArea1);

	double triArea2 = triangleArea(1, 1, 10); // Should fail precondition
	writeln("triArea2: ", triArea2);
}

double triangleArea(double a, double b, double c)
in
{
	// Every side must be greated than zero
	assert(a > 0);
	assert(b > 0);
	assert(c > 0);

	// Every side must be less than the sum of the other two
	assert(a < (b + c));
	assert(b < (a + c));
	assert(c < (a + b));
}
out (result)
{
	assert(result > 0);
}
do
{
	immutable halfPerimeter = (a + b + c) / 2;

	return sqrt(halfPerimeter
			* (halfPerimeter - a)
			* (halfPerimeter - b)
			* (halfPerimeter - c));
}
