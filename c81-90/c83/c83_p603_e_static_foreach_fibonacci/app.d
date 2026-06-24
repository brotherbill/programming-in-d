import std.stdio;
import std.range;
import std.algorithm;

static foreach (n; FibonacciSeries().take(10).filter!isEven)
{
	// writeln not valid as module level (scope 0)
	pragma(msg, "pragma: ", n);
}

void main()
{
	foreach (n; FibonacciSeries().take(10).filter!isEven) {
		writeln("main(): ", n);
	}
}

bool isEven(int n) {
	return n % 2 == 0;
}

struct FibonacciSeries
{
	int current = 0;
	int next = 1;
	enum empty = false;
	int front() const
	{
		return current;
	}

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
