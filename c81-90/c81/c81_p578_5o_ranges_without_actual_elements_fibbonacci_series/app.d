import std.stdio;
import std.range;

void main()
{
	print(FibonacciSeries());		// never terminates
}

struct FibonacciSeries
{
	int current = 0;
	int next    = 1;

	enum empty  = false; 	// ← infinite range

	int front() const => current;

	// Generate next element of Fibbonacci series
	void popFront()
	{
		const nextNext = current + next;
		current = next;
		next = nextNext;
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