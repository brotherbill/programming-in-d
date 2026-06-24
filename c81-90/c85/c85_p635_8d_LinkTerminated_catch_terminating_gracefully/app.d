import std.stdio       : writeln;
import std.concurrency : spawnLinked, send, receiveOnly, ownerTid, LinkTerminated;

void main()
{
	auto worker = spawnLinked(&workerFunc);

	bool isDone = false;

	while (!isDone)
	{
		try
		{
			// ← An exception is thrown if the worker has terminated.
			auto m = receiveOnly!int();
			writeln("Message: ", m);
		}
		catch (LinkTerminated exc)
		{
			writeln("The worker has terminated");
			isDone = true;
		}
	}
}

void workerFunc()
{
	ownerTid.send(10);
	ownerTid.send(20);
} // ← Terminates after sending two messages
