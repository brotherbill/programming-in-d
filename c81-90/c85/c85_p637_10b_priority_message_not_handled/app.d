import std.stdio       : writeln;
import std.concurrency : spawn, receive, send, prioritySend;
import core.thread     : Thread;
import std.datetime    : seconds;

void main()
{
    auto worker = spawn(&workerFunc);
   
    worker.send(10);
    worker.send(42);
    worker.send("hello");
    prioritySend(worker, "important");
	prioritySend(worker, 3.14159);		// double not handled
    worker.send(-1); // ← to terminate the worker
}

void workerFunc()
{
    bool isDone = false;

    while (!isDone)
    {
        void intHandler(int message)
        {
            Thread.sleep(1.seconds);
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
