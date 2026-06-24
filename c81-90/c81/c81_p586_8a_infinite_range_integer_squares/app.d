import std.stdio;
import std.range;

void main()
{
	auto squares = new SquaresRange();
	
	writeln("squares.first: ", squares.first);
	writefln("squares[5] = %s", squares[5]);
	writefln("squares[10] = %s", squares[10]);
	writeln;

	squares.popFront;
	writeln("*** squares.popFront; ***");
	writeln("squares.first: ", squares.first);
	writefln("squares[-1] = %s", squares[-1]);
	writefln("squares[0]  = %s", squares[0]);
	writefln("squares[5]  = %s", squares[5]);
	writefln("squares[10] = %s", squares[10]);
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
