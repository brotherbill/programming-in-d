import std.stdio;
import std.datetime.stopwatch;

// A function with a fast body:
ubyte compute(ubyte i)
{
    return cast(ubyte)(i * 42);
}

void main()
{
    size_t counter = 0;
    StopWatch sw;

    sw.start();

    // A short loop that repeats many times:
    foreach (i; 0 .. 100_000_000)
    {
        const number = cast(ubyte) i;
        if (compute(number) == number)
        {
            ++counter;
        }
    }

    sw.stop();

    writefln("%s milliseconds", sw.peek.total!"msecs");
}
