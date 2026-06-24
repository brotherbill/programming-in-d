import std.stdio : writefln;
import std.concurrency : Tid, send, spawn, receiveOnly, ownerTid;
import std.conv : to;

void main()
{
	Tid calculator = spawn(&calculate);
	
	calculator.send("1.2");
	calculator.send("hello"); // ← incorrect input, hangs here
	calculator.send("3.4");

	foreach (i; 0 .. 3)
	{
		auto message = receiveOnly!double();
		writefln("result %s: %s", i, message);
	}
}

void calculate()
{
	while (true)
	{
		auto message = receiveOnly!string();
		ownerTid.send(to!double(message) + 0.5);
	}
}
