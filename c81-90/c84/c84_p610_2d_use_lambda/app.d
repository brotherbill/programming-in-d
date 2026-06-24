import std.parallelism;

void main()
{
	import std.stdio : writeln;
	
	auto theTask = task((int value) {
		writeln("Task running with value: ", value);
	}, 42);
	
}

double foo(int i)
{
	return i * 1.5;
}

double bar(int i)
{
	return i * 2.5;
}
