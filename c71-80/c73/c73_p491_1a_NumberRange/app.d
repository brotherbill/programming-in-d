import std.stdio;

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

}
