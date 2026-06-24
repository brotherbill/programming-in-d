import std.stdio;
import std.range;

void main()
{
	foreach (element; NumberRange(3, 7))
	{
		write(element, ' ');
	}

	writeln;

	// Equivalent manually unrolled
	auto nr = NumberRange(3, 7);
	while (!nr.empty)
	{
		write(nr.front, ' ');
		nr.popFront;
	}
	writeln;
	writeln;

	writeln("Shift into Reverse");
	foreach (element; NumberRange(3, 7).retro)
	{
		write(element, ' ');
	}
	writeln;

	// Equivalent manually unrolled
	nr = NumberRange(3, 7);
	while (!nr.empty)
	{
		write(nr.back, ' ');
		nr.popBack;
	}
	writeln;

}

struct NumberRange
{
	int begin;
	int end;

	invariant ()
	{
		// There is a bug if begin is greater than end
		assert(begin <= end);
	}

	bool empty() const
	{
		// The range is consumed when begin equals end
		return begin == end;
	}

	void popFront()
	in
	{
		assert(!empty, "not empty");
	}
	do
	{
		// Skipping the first element is achieved by incrementing the beginning of the range
		++begin;
	}

	int front() const
	in
	{
		assert(!empty, "not empty");
	}
	do
	{
		// The front element is the one at the beginning
		return begin;
	}

	// For std.range.retro

	void popBack()
	in
	{
		assert(!empty, "not empty");
	}
	do
	{
		// Skipping the last element is achieved by decrementing the end of the range
		--end;
	}

	int back() const
	in
	{
		assert(!empty, "not empty");
	}
	do
	{
		// As the 'end' value is outside of the range, the last element is one less than that
		return end - 1;
	}

	NumberRange save() const
	{
		// Returning a copy of this struct object
		return this;
	}
}
