import std.stdio;
import core.thread;
import std.parallelism;
import std.datetime.timezone : LocalTime;
import std.datetime : Clock;

void main()
{
    auto range = Range(10);

    auto asyncRange = taskPool.asyncBuf(range, 2);
	writeln("asyncRange.front: ", asyncRange.front);
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
