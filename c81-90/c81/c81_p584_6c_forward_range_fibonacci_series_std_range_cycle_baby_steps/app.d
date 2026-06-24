import std.stdio;
import std.range : cycle, popFrontN, take;

void main()
{
	auto series                   = FibonacciSeries();
	auto firstPart                = series.take(5);
	auto cycledThrough            = firstPart.cycle;
	auto firstPartOfCycledThrough = cycledThrough.take(20);

	writeln(firstPartOfCycledThrough);
}

void report(T)(const dchar[] title, const ref T range)
{
	writefln("%40s: %s", title, range.take(5));
}

struct FibonacciSeries
{
	int current = 0;
	int next = 1;

	enum empty = false; // ← infinite range

	int front() const => current;

	// Generate next element of Fibbonacci series
	void popFront()
	{
		const nextNext = current + next;
		current = next;
		next = nextNext;
	}

	FibonacciSeries save() const
	{
		return this;
	}
}

void print(T)(T range)
{
	for (; !range.empty; range.popFront())
	{
		write(' ', range.front);
	}

	writeln();
}
