import std.stdio     : writeln;
import std.string    : format;
import std.exception : enforce;
import std.random    : uniform;

int[] randomDieValues(int count)
{
    enforce(count >= 0, format("Invalid die count: %s", count));

    int[] values;
    foreach (i; 0 .. count)
    {
        values ~= uniform(1, 7);  // Fails on Windows for version 2.111.0.  Works on Linux.
    }
    return values;
}

void main()
{
    randomDieValues(3).writeln;
    randomDieValues(-5).writeln;
}
