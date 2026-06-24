import std.stdio       : writeln;
import std.concurrency : spawn, send, receive;

void main()
{
	auto worker = spawn(&workerFunc);
	
	worker.send(10);
	worker.send(42);
	worker.send("hello");
	worker.send(-1); // ← to terminate the worker
}

void workerFunc()
{
	bool isDone = false;

	while (!isDone)
	{
		void intHandler(int message)
		{
			writeln("handling int message: ", message);
			if (message == -1)
			{
				writeln("exiting");
				isDone = true;
			}
		}

		void stringHandler(string message)
		{
			writeln("handling string message: ", message);
		}

		receive(&intHandler, &stringHandler);
	}
}
