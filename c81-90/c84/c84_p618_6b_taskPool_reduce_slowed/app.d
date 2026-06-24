import std.stdio             : writeln, writefln;
import std.algorithm         : reduce;
import core.thread           : Thread;
import std.datetime.timezone : LocalTime;
import std.datetime          : Clock, seconds;

void main()
{
	writeln("Result: ", reduce!aCalculation(0, [1, 2, 3, 4]));
}

int aCalculation(int result, int element)
{
	writefln("%s started  - element: %s, result: %s", Clock.currTime, element, result);

	Thread.sleep(1.seconds);
	result += element;
	writefln("%s finished - element: %s, result: %s", Clock.currTime, element, result);
	return result;
}
