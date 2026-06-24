import std.stdio;
import std.array;

void main()
{
	auto a = alternatingEnds([1, 2, 3, 4, 5]);
	writeln(a);
}

auto alternatingEnds(T)(T[] slice)
{
	bool isFromFront = true;

	struct EndAlternatingRange
	{
		bool empty() const
		{
			return slice.empty;
		}

		T front() const
		{
			return isFromFront ? slice.front : slice.back;
		}

		void popFront()
		{
			if (isFromFront)
			{
				slice.popFront();
				isFromFront = false;
			}
			else
			{
				slice.popBack();
				isFromFront = true;
			}
		}
	}

	return EndAlternatingRange();
}
