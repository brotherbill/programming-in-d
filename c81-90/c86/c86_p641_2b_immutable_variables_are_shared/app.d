import std.stdio : writeln;
import std.concurrency : spawn;
import core.thread : thread_joinAll;

void main()
{
	immutable(int) i = 42;
	spawn(&worker, &i); 	// ← compiles
	thread_joinAll();
}

void worker(immutable(int)* data)
{
	writeln("worker() data: ", *data);
}
