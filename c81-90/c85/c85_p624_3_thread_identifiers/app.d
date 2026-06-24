import std.stdio;
import std.concurrency;

void main()
{
	Tid myWorker = spawn(&worker);
	writeln("myWorker: ", myWorker);
	printTid("Owner ");
}

void printTid(string tag)
{
	writefln("%s: %s", tag, thisTid);
}

void worker()
{
	writeln("worker() Owner thread id: ", ownerTid);
	printTid("Worker");
}
