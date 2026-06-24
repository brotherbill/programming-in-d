import std.stdio : writeln;
import std.concurrency : spawn, send, receive, Variant;

void main()
{
	auto worker = spawn(&workerFunc);
	worker.send(SpecialMessage());
}

void workerFunc()
{
	receive(
		(int message)     { /* ... */ },
		(double message)  { /* ... */ },
		(Variant message) { writeln("Unexpected message: ", message); });
}

struct SpecialMessage
{
}
