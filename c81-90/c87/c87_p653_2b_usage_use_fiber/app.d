import std.stdio    : writeln;
import core.thread  : Thread, Fiber;
import std.datetime : msecs;

void main()
{
	 auto fiber = new MyFiber();
	 fiber.call;

	foreach (i; 0 .. 10) {
		Thread.sleep(100.msecs);
		writeln("main() i: ", i);
		if (i == 2) fiber.call;
	}

	writeln("main() fiber.state: ", fiber.state);
}

class MyFiber : Fiber
{
	this()
	{
		super(&run);
	}

	void run()
	{
		writeln("MyFiber.run()");
		foreach (i; 0 .. 5) {
			Thread.sleep(500.msecs);
			writeln("MyFiber.run() i: ", i);
			if (i == 2) {
				Fiber.yield;	// Fiber yields, so this function doesn't resume
				Thread.sleep(250.msecs);
				
			}
		}
	}
}
