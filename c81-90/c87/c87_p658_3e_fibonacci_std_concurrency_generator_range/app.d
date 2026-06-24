import std.stdio       : writefln;
import std.range       : take;
import std.concurrency : yield, Generator;

// This alias is used for resolving the name conflict with std.range.Generator. 
alias FiberRange = Generator;

void main()
{
	auto series = new FiberRange!int(&fibonacciSeries);
	writefln("%(%s %)", series.take(10));
}

void fibonacciSeries()
{
	int current = 0;
	int next    = 1;
	
	while (true)
	{
		yield(current);
		const nextNext = current + next;
		current = next;
		next = nextNext;
	}
}
