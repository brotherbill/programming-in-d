import std.stdio;
import std.range : cycle, popFrontN, take;

void main()
{
    writeln(FibonacciSeries().take(5).cycle.take(20));
}

void report(T)(const dchar[] title, const ref T range)
{
    writefln("%40s: %s", title, range.take(5));
}

struct FibonacciSeries
{
    int current = 0;
    int next = 1;

    enum empty = false; // ← infinite range

    int front() const => current;

    // Generate next element of Fibbonacci series
    void popFront()
    {
        const nextNext = current + next;
        current = next;
        next = nextNext;
    }

    FibonacciSeries save() const
    {
        return this;
    }
}

void print(T)(T range)
{
    for (; !range.empty; range.popFront())
    {
        write(' ', range.front);
    }

    writeln();
}
