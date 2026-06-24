import std.stdio : writefln;
import std.concurrency : send, spawn, receiveOnly, Tid, ownerTid, thisTid;
import std.conv : to;

void main()
{
	Tid worker = spawn(&workerFunc);
	Tid ownerTid = spawn(&workerFunc3);

	foreach (value; 1 .. 5)
	{
		worker.send(value);
		double result = receiveOnly!double(); // blocks waiting for double
		writefln("sent: %s, received: %s", value, result);
	}

	// send three arguments
	ownerTid.send(thisTid, 42, 1.5);

	// Sending a negative value to the worker so that it terminates.
	worker.send(-1);
}

// workerFunc has type void.
void workerFunc()
{
	int value = 0;

	while (value >= 0)
	{
		value = receiveOnly!int();
		double result = to!double(value) / 5;
		ownerTid.send(result);
	}
}

// workerFunc3 has type void.
void workerFunc3()
{
	auto message = receiveOnly!(Tid, int, double)();

	auto sender   = message[0];	// of type Tid
	auto integer  = message[1];	// of type int
	auto floating = message[2]; // of type double
	writefln("workerFunc3() sender: %s, integer: %s, floating: %s", sender, integer, floating);
}
