import std.stdio;
import std.concurrency;

struct Exit
{
}

void workerFunc()
{
	bool isDone = false;
	
	while (!isDone)
	{
		receive(
			(int message)    { writeln("int message: ",    message); },
			(string message) { writeln("string message: ", message); },
			(Exit message)   { writeln("exiting");         isDone = true; });
	}
}

void main()
{
	auto worker = spawn(&workerFunc);
	worker.send(10);
	worker.send(42);
	worker.send("hello");
	worker.send(Exit());
}
