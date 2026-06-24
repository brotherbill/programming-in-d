import std.stdio;
import std.parallelism;

double foo(int i)
{	
	double result = i * 1.5;
	writefln("foo(%s) = %s", i, result);
	return result;
}

double bar(int i)
{
	double result = i * 2.5;
	writefln("bar(%s) = %s", i, result);
	return result;
}

void main()
{
	auto tasks = [task(&foo, 1), task(&bar, 2)]; 	// ← compiles

	foreach (task; tasks) {
		task.executeInNewThread;
	}

	foreach (task; tasks) {
		immutable result = task.yieldForce;
		writeln("result: ", result);
	}

}
