import std.stdio       : writeln;
import std.concurrency : spawn, receiveTimeout, send, ownerTid;
import std.datetime    : seconds, msecs;
import core.thread     : Thread;

void main()
{
	spawn(&workerFunc);
	writeln("Waiting for a message");

	bool received = false;

	while (!received)
	{
		received = receiveTimeout(600.msecs, (string message) { writeln("received: ", message); });
		
		if (!received)
		{
			writeln("... no message yet");
			/* ... other operations may be executed here ... */
		}
	}
}

void workerFunc()
{
	Thread.sleep(3.seconds);
	ownerTid.send("hello");
}
