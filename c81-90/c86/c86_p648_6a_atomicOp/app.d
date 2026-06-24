import std.stdio       : writeln;
import std.concurrency : spawn;
import core.thread     : thread_joinAll;
import core.atomic     : atomicOp;

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
		atomicOp!"+="(*value, 1);
	}
}

void decrementer(shared(int)* value)
{
	foreach (i; 0 .. count)
	{
		atomicOp!"-="(*value, 1);
	}
}
