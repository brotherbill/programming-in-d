import std.stdio;
import std.range : popFrontN, take;

void main()
{
	auto range = FibonacciSeries();
	report("Original range", range);

	range.popFrontN(2);
	report("After removing two elements", range);

	auto theCopy = range.save;
	report("The copy", theCopy);

	range.popFrontN(3);
	report("After removing three more elements", range);

	report("The copy", theCopy);
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
