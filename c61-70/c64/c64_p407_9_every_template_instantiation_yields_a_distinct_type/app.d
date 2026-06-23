import std.stdio;

void main()
{
    Point!int    point3 = Point!double(0.25, 0.75);
    Point!double point2 = Point!int(3, 4); // won't compile even though int can be converted to double
}

struct Point(T = int)
{
    T x; // in Kilometers
    T y; // in Kilometers
}
