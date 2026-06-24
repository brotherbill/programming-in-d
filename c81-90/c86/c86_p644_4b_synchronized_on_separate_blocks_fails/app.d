import std.stdio;
import std.concurrency;
import core.thread;

enum count = 1000;

void main()
{
	shared(int) number = 0;

	foreach (i; 0 .. 100)
	{
		spawn(&incrementer, &number);
		spawn(&decrementer, &number);
	}
	thread_joinAll();
	writeln("Final value: ", number);
}

void incrementer(shared(int)* value)
{
	foreach (i; 0 .. count)
	{
		synchronized
		{ // ← This lock is different from the one below.
			*value = *value + 1;
		}
	}
}

void decrementer(shared(int)* value)
{
	foreach (i; 0 .. count)
	{
		synchronized
		{ // ← This lock is different from the one above.
			*value = *value - 1;
		}
	}
}
