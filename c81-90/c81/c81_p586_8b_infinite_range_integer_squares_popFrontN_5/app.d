import std.stdio;
import std.range;

void main()
{
	auto squares = new SquaresRange();

	squares.popFrontN(5);
	writeln(squares[0]);
}

class SquaresRange
{
	int first;

	this(int first = 0)
	{
		this.first = first;
	}

	enum empty = false;

	int front() const
	{
		return opIndex(0);
	}

	void popFront()
	{
		++first;
	}

	SquaresRange save() const
	{
		return new SquaresRange(first);
	}

	int opIndex(size_t index) const
	{
		// This function operates at constant time
		immutable integerValue = first + cast(int) index;

		return integerValue * integerValue;
	}
}
