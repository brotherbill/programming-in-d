import std.stdio : writeln;
import std.concurrency : spawnLinked, send, receiveOnly, ownerTid;

void main()
{
	auto worker = spawnLinked(&workerFunc);
	while (true)
	{
		// ← An exception is thrown if the worker has terminated.
		auto m = receiveOnly!int(); 
 
		writeln("Message: ", m);
	}
}

void workerFunc()
{
	ownerTid.send(10);
	ownerTid.send(20);
} // ← Terminates after sending two messages
