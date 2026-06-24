import std.stdio : writeln;
import std.range : take;
import std.algorithm : filter;

void main()
{
	auto squares = new SquaresRange;

	writeln(squares.take(50).filter!are_lastTwoDigitsSame);
}

bool are_lastTwoDigitsSame(int value)
{
	// Must have at least two digits
	if (value < 10)
	{
		return false;
	}

	// Last two digits must be divisible by 11
	immutable lastTwoDigits = value % 100;

	return (lastTwoDigits % 11) == 0;
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
