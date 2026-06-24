import std.stdio;

void main()
{
	auto polygon = Polygon(Color.blue, [Point(0, 0), Point(1, 1), Point(3, 4)]);

	foreach (i, point; polygon)
	{
		writeln(i, ": ", point);
	}
}

enum Color
{
	blue,
	green,
	red
}

struct Point
{
	int x;
	int y;
}

struct Polygon
{
	Color color;
	Point[] points;

	int opApply(int delegate(ref const Point) dg) const
	{
		int result = 0;

		foreach (point; points)
		{
			result = dg(point);

			if (result)
			{
				break;
			}
		}

		return result;
	}

	int opApply(int delegate(ref size_t, ref const(Point)) dg) const
	{
		int result = 0;
		size_t i;

		while (i < points.length)
		{
			Point point = points[i];
			i += 1;
			result = dg(i, point);

			if (result)
			{
				break;
			}
		}

		return result;
	}
}
