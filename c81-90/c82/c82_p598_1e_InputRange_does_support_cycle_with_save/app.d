import std.stdio;
import std.range;
import fibonacci_series;
import negative_module;

void main()
{
	writeln(FibonacciSeries()
			.take(5)
			.negative
			.mycycle
			.take(10));
}

auto mycycle(R)(R r)
{
	struct cycle
	{
		R r;
		R backup;

		auto front() => r.front;

		void popFront()
		{
			r.popFront();
			if (r.empty)
			{
				r = backup;
			}
		}

		enum empty = false;
	}

	return cycle(r, r);
}
