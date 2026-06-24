import std.stdio;
import std.parallelism;

double foo(int i) => i * 1.5;
// {
// 	double result = i * 1.5;
// 	writefln("foo(%s) = %s", i, result);
// 	return result;
// }

double bar(int i) => i * 2.5;
// {
// 	double result = i * 2.5;
// 	writefln("bar(%s) = %s", i, result);
// 	return result;
// }

void main()
{
	auto theTask = task((int value) { 
		double result = value * 10.0;
		writefln("theTask(%s) = %s", value, result);
		return result; 
	}, 42);
	theTask.executeInNewThread;
	immutable theTaskResult = theTask.yieldForce;
	writeln("theTaskResult: ", theTaskResult);
	writeln;

	auto tasks = [task(&foo, 1), task(&bar, 2)]; // ← compiles

	foreach (task; tasks)
	{
		task.executeInNewThread;
	}

	foreach (task; tasks)
	{
		immutable result = task.yieldForce;
		writeln("result: ", result);
	}

}
