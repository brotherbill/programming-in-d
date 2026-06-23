import std.stdio  : writeln;
import std.format : format;

void main()
{
    auto result = averageAge(-1, 10);
    writeln("result: ", result);
}

double averageAge(double first, double second)
{
    assert(first  >= 0, format("first age of `%s' should be at least zero", first));
    assert(second >= 0, format("second age of `%s' should be at least zero", second));

    return (first + second) / 2;
}
