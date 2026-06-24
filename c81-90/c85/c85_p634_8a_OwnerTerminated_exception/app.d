import std.stdio       : writeln;
import std.concurrency : spawn, send, receiveOnly;

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
	while (true)
	{
		// ← An exception is thrown if the owner has terminated.
		auto m = receiveOnly!int(); 

		writeln("Message: ", m);
	}
}
