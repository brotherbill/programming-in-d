import std.stdio;
import core.thread;
import std.parallelism;
import std.datetime.timezone : LocalTime;
import std.datetime : Clock;

void main()
{
    auto range = Range(10);

    foreach (element; taskPool.asyncBuf(range, 2))
    {
        writefln("%s Using element %s", Clock.currTime, element);
        Thread.sleep(500.msecs);
    }
}

struct Range
{
    int limit;
    int i;

    bool empty() const => i >= limit;
    int front() const => i;

    void popFront()
    {
        writefln("%s Producing the element after %s", Clock.currTime, i);
        Thread.sleep(500.msecs);
        ++i;
    }
}
