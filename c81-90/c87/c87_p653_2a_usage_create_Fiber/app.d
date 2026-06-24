import std.stdio : writeln;
import core.thread : Fiber;

void main()
{
	auto fiber = new Fiber(&fiberFunction);
}

void fiberFunction() {
 	writeln("fiberFunction()");
 }