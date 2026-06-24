import std.stdio;
import std.algorithm;
import std.parallelism;
import core.thread;
import std.datetime.timezone : LocalTime;
import std.datetime          : Clock;

int aCalculation(int result, int element)
{
	writefln("%s started  - element: %s, result: %s", Clock.currTime, element, result);

	Thread.sleep(1.seconds);
	result += element;
	writefln("%s finished - element: %s, result: %s", Clock.currTime, element, result);
	return result;
}

void main()
{
	writeln("Result: ", taskPool.reduce!aCalculation(0, [1, 2, 3, 4]));
}
