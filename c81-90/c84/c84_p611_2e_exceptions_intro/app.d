import std.stdio;
import std.parallelism;
import core.thread;

void main()
{
	auto theTask = task!mayThrow();
	theTask.executeInNewThread();
	writeln("main is continuing");
	Thread.sleep(3.seconds);
	writeln("main is waiting for the task");
	theTask.yieldForce();
}

void mayThrow()
{
	writeln("mayThrow() is started");
	Thread.sleep(1.seconds);
	writeln("mayThrow() is throwing an exception");
	throw new Exception("Error message");
}
