import std.stdio;
import std.math;

void main()
{
	auto threeFourFive = Triangle(3, 4, 5);
	writeln(threeFourFive.area);

	auto negativeSide = Triangle(-1, 1, 1);		// At run time, assertion failure
	auto sideTooLong = Triangle(1, 1, 10);		// At run time, assertion failure
}

struct Triangle
{
private:

	double a;
	double b;
	double c;

public:

	this(double a, double b, double c)
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
	do
	{
		this.a = a;
		this.b = b;
		this.c = c;
	}

	double area() const
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
}
