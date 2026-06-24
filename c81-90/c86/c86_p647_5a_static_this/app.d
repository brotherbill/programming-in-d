import std.stdio : writeln;
import std.concurrency : spawn;
import core.thread : thread_joinAll;

void main()
{
	spawn(&worker);
	thread_joinAll();
}

static this()
{
	writeln("executing static this()");
}

void worker()
{
}
