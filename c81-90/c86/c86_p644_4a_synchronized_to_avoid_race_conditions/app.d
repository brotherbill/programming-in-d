import std.stdio       : writefln;
import std.concurrency : spawn;
import core.thread     : thread_joinAll;

void main()
{
	shared(int) i = 1;
	shared(int) j = 2;

	writefln("before: %s and %s", i, j);

	foreach (id; 0 .. 10)
	{
		spawn(&swapper, &i, &j);
	}

	// Wait for all threads to finish their tasks
	thread_joinAll();

	writefln("after : %s and %s", i, j);
}

void swapper(shared(int)* first, shared(int)* second)
{
	foreach (i; 0 .. 100_000)
	{
		synchronized
		{
			int temp = *second;
			*second  = *first;
			*first   = temp;
		}
	}
}
