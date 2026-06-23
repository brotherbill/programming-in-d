import std.stdio;
import std.math;

void main()
{
    intPointDistance;
    doublePointDistance;
}

void intPointDistance()
{
    auto center = Point!int(0, 0);
    auto branch = Point!int(100, 100);

    writeln("Distance (int)   : ", center.distanceTo(branch));
}

void doublePointDistance()
{
    auto center = Point!double(1.2, 3.4);
    auto branch = Point!double(5.6, 7.8);

    writeln("Distance (double): ", center.distanceTo(branch));
}

struct Point(T)
{
    T x; // in Kilometers
    T y; // in Kilometers

    T distanceTo(Point that) const
    {
        immutable real xDistance = x - that.x;
        immutable real yDistance = y - that.y;

        immutable distance = sqrt((xDistance * xDistance) + (yDistance * yDistance));

        return cast(T) distance;
    }
}

Point!T getResponse(T : Point!T)(string question)   // 2, 1
{ 
    writefln("%s (Point)", question);               // 5

    auto x = getResponse!T("  x");                  // 3a
    auto y = getResponse!T("  y");                  // 3b

    return Point!T(x, y);                           // 4
}

// 1. In order for this template specialization to support all instantiations of Point,
//    the template parameter list must mention Point!T.  This simply means that
//    the getResponse() specialization is for Point!T, regardless of T.  
//    This specialization would match Point!int, Point!double, etc.
// 2. Similarly, to return the correct type as the response,
//    the return type must be specified as Point!T as well.
// 3. Since the types of x and y members of Point!T are now T, as opposed to int,
//    the members must be read by calling getResponse!T(), not getResponse!int(),
//    as the latter would be correct only for Point!int.
// 4. Similar to items 1 and 2, the type of the return value is Point!T.
// 5. To print the name of the type accurately for every type, as in Point!int,
//    Point!double, etc., T.stringof is used.
