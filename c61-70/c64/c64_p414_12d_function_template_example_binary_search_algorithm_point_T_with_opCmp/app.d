import std.stdio;
import std.conv : to;
import std.array;
import std.algorithm;
import binary_search;
import point;

void main() {
    Point!int[] points;

    foreach (i; 0 .. 15) {
        points ~= Point!int(i, i);
    }

	writeln("Points: ", points.map!(p => p.toString()).join(", "));
    assert(binarySearch(points, Point!int(10, 10)) == 10);
}
