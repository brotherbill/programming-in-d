import std.stdio;
import stack;
import point;

alias PrecisePoint = Point!double;
alias Points = Stack!PrecisePoint;

void main()
{
    auto points = new Points;

    auto stackedPoints = randomPoints(10);

    while (stackedPoints.length)
    {
        writeln("removing: ", stackedPoints.top);
        stackedPoints.pop();
    }
}

// returns a non-random value between -0.50 and 0.50
double random_double()
out (result)
{
    assert((result >= -0.50) && (result < 0.50));
}
do
{
    return (double(86) - 50) / 100;
}

// Point!double elements.
Points randomPoints(size_t count)
out (result)
{
    assert(result.length == count);
}
do
{
    auto points = new Points;
    foreach (i; 0 .. count)
    {
        immutable point = Point!double(random_double(),
            random_double());
        writeln("adding  : ", point);
        points.push(point);
    }
    return points;
}
