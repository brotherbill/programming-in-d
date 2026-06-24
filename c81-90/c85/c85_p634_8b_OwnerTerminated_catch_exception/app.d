import std.stdio       : writeln;
import std.concurrency : spawn, send, receiveOnly, OwnerTerminated;

void main()
{
	spawn(&intermediaryFunc);
}

void intermediaryFunc()
{
	auto worker = spawn(&workerFunc);
	worker.send(1);
	worker.send(2);
} // ← Terminates after sending two messages

void workerFunc()
{
	bool isDone = false;
	while (!isDone)
	{
		try
		{
			auto m = receiveOnly!int();
			writeln("Message: ", m);
		}
		catch (OwnerTerminated exc)
		{
			writeln("The owner has terminated.");
			isDone = true;
		}
	}
}
