import std.stdio;
import std.range;
import std.algorithm;
import std.string;
import squares_range;
import fibonacci_series;

void main()
{
	auto range = Together(FibonacciSeries().take(10).array,
		[777, 888],
		(new SquaresRange()).take(5).array);

	 writeln(range.save);

	 writeln(range.save.retro);
}

struct Together
{
	const(int)[][] slices;

	this(const(int)[][] slices...)
	{
		this.slices = slices.dup;

		clearFront();
		clearBack();
	}

	bool empty() const => slices.empty;
	int front() const => slices.front.front;
	Together save() const => Together(slices.dup);
	int back() const => slices.back.back;

	void popFront()
	{
		slices.front.popFront();
		clearFront();
	}

	void popBack()
	{
		slices.back.popBack();
		clearBack();
	}

	int opIndex(size_t index) const
	{
		// Save the index for the error message
		immutable originalIndex = index;

		foreach (slice; slices)
		{
			if (slice.length > index)
			{
				return slice[index];
			}
			else
			{
				index -= slice.length;
			}
		}

		throw new Exception(format("Invalid index: %s (length: %s)", originalIndex, this.length));
	}

	private void clearFront()
	{
		while (!slices.empty && slices.front.empty)
		{
			slices.popFront();
		}
	}

	size_t length() const
	{
		size_t totalLength = 0;

		foreach (slice; slices)
		{
			totalLength += slice.length;
		}

		return totalLength;
	}

	size_t lengthFunctional() const => slices.fold!((acc, item) => acc + item.length)(size_t.init);

	private void clearBack()
	{
		while (!slices.empty && slices.back.empty)
		{
			slices.popBack();
		}
	}
}
