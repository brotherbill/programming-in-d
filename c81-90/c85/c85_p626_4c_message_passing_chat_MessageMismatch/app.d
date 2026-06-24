import std.concurrency;

void main()
{
	spawn(&workerFunc);
	auto message = receiveOnly!double(); // ← Expecting double
}

void workerFunc()
{
	ownerTid.send("hello"); // ← Sending string
}
