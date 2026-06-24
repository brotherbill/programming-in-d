import std.stdio : writeln;
import core.thread : Fiber;

int sharedData = 10;

void main()
{
	writeln("main() before sharedData: ", sharedData);
	auto fiber = new Fiber(&fiberFunction);
	fiber.call;
	writeln("main() after sharedData: ", sharedData);
}

void fiberFunction()
{
	// ...
	func();
	sharedData *= 2;
	Fiber.yield();
	// ...
}

void func() {
	writeln("func()");
}
