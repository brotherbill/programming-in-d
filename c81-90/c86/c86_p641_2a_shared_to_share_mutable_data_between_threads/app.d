import std.stdio       : writeln;
import std.concurrency : spawn;
import core.thread     : Thread;
import core.time       : msecs, seconds;

void main()
{
	shared(bool) isDone = false;
	spawn(&worker, &isDone);
	writeln("main");

	Thread.sleep(1.seconds);

	// Signalling the worker to terminate:
	isDone = true;
	writeln("main() isDone: ", isDone);
}

void worker(shared(bool)* isDone)
{
	writeln("worker() before while, isDone: ", *isDone);
	while (*isDone == false)
	{
		Thread.sleep(250.msecs);
		writeln("worker() isDone: ", *isDone);
	}
}
