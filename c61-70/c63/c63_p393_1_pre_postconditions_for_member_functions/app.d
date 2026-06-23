import std.stdio;
import std.math;

void main()
{
	auto threeFourFive = Triangle(3, 4, 5);
	writeln(threeFourFive.area);
}

struct Triangle
{
private:

	double a;
	double b;
	double c;

public:

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
