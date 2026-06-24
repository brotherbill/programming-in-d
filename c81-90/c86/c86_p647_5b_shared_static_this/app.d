import std.stdio       : writeln;
import std.concurrency : spawn;
import core.thread     : thread_joinAll;

int a; 				// thread-local
immutable int b; 	// shared by all threads

void main()
{
	spawn(&worker);
	thread_joinAll();
}

static this()
{
	writeln("Initializing per-thread variable at ", &a);
	a = 42;
}

shared static this()
{
	writeln("Initializing per-program variable at ", &b);
	b = 43;
}

void worker()
{
}
