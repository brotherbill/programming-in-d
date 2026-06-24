import std.stdio       : writeln;
import std.concurrency : spawnLinked, receive, send, LinkTerminated, ownerTid;

void main()
{
	auto worker = spawnLinked(&workerFunc);

	bool isDone = false;

	while (!isDone)
	{
		receive(
			(int message)
			{
				writeln("Message: ", message);
			},

			(LinkTerminated exc)
			{
				writeln("The owner has terminated; exiting."); 
				isDone = true;
			},
		);
	}
}

void workerFunc()
{
	ownerTid.send(10); 
	ownerTid.send(20);
} // ← Terminates after sending two messages
