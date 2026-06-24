import std.stdio;
import std.string;

void main()
{
	auto polygon = Polygon(
		[
		ColoredPoint(Color(10, 10, 10), Point(1, 1)),
		ColoredPoint(Color(20, 20, 20), Point(2, 2)),
		ColoredPoint(Color(30, 30, 30), Point(3, 3))
	]);
	writeln(polygon);
}

struct Point
{
	int x;
	int y;

	string toString() const
	{
		return format("(%s,%s)", x, y);
	}
}

struct Color
{
	ubyte r;
	ubyte g;
	ubyte b;

	string toString() const
	{
		return format("RGB:%s,%s,%s", r, g, b);
	}
}

struct ColoredPoint
{
	Color color;
	Point point;

	string toString() const
	{
		// Taking advantage of Color.toString and Point.toString:
		return format("{%s;%s}", color, point);
	}
}

struct Polygon
{
	ColoredPoint[] points;

	string toString() const
	{
		// Taking advantage of ColoredPoint.toString: 
		return format("%s", points);
	}
}
