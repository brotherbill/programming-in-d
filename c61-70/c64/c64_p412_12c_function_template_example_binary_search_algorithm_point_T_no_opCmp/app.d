import std.stdio;
import std.conv : to;
import binary_search;
import point;

void main()
{
	Point!int[] points;

	foreach (i; 0 .. 15)
	{
		points ~= Point!int(i, i);
	}

	assert(binarySearch(points, Point!int(10, 10)) == 10);
}
