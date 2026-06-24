import std.stdio       : writeln;
import std.concurrency : spawn;
import core.thread     : thread_joinAll;

enum count = 1000;

void main()
{
	shared(Lock) lock = new shared(Lock)();  // ending () may be removed
	shared(int) number = 0;

	foreach (i; 0 .. 100)
	{
		spawn(&incrementer, &number, lock);
		spawn(&decrementer, &number, lock);
	}

	thread_joinAll();
	writeln("Final value: ", number);
}

class Lock
{
}

void incrementer(shared(int)* value, shared(Lock) lock)
{
	foreach (i; 0 .. count)
	{
		synchronized (lock)
		{
			*value = *value + 1;
		}
	}
}

void decrementer(shared(int)* value, shared(Lock) lock)
{
	foreach (i; 0 .. count)
	{
		synchronized (lock)
		{
			*value = *value - 1;
		}
	}
}
