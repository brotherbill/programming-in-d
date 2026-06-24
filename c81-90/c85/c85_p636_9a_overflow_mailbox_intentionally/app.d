// WARNING: Your system may become unresponsive when this program is running.
import std.stdio : writeln;
import std.concurrency : spawn, receive, send, ownerTid;
import core.thread : Thread;
import std.datetime : seconds;

void main()
{
	spawn(&workerFunc);

	while (true)
	{
		receive(
			(int message) {
			// Spends time for each message
			Thread.sleep(1.seconds);
			writeln(message);
		});
	}
}

void workerFunc()
{
	while (true)
	{
		ownerTid.send(42);	// ← Produces messages continuously
	}
}
