import std.stdio;

void main()
{
	auto triangle = Triangle().construct;
	auto rectangle = Rectangle().construct;
	auto pentagon = Pentagon().construct;

	writeln("triangle : ", triangle);
	writeln("rectangle: ", rectangle);
	writeln("pentagon : ", pentagon);
}

alias Triangle = Polygon!3;
alias Rectangle = Polygon!4;
alias Pentagon = Polygon!5;

struct Point
{
	double x;
	double y;
}

struct Polygon(size_t N)
{
	Point[N] corners;

	Polygon!N construct()
	{
		foreach (i; 0 .. N)
		{
			corners[i].x = 0;
			corners[i].y = 0;
		}
		return this;
	}
}
