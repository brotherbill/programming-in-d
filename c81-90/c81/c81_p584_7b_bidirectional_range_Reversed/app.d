import std.stdio;
import std.array;

void main()
{
	writeln(Reversed([1, 2, 3]));
	writeln([1, 2, 3].Reversed);
}

struct Reversed
{
	int[] range;
	this(int[] range)
	{
		this.range = range;
	}

	bool empty() const
	{
		return range.empty;
	}

	int front() const
	{
		return range.back; 	// ← reverse
	}

	int back() const
	{
		return range.front; // ← reverse
	}

	void popFront()
	{
		range.popBack();
	}

	void popBack()
	{
		range.popFront();
	}
}
