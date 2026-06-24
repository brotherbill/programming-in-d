import std.stdio;

void main()
{
	int[] values = [0, 1, 2, 3];

	writeln("values[1 .. 3]", values[1 .. 3]); // 1 and 2 included, 3 excluded
	writeln;

	// The address of the second element:
	int* begin = &values[1];

	// The address of two elements beyond that one
	tenTimes(begin, begin + 2);

	writeln("values using ptrs: ", values);
	writeln;

	forLoopExample;
	writeln;

	foreachLoopExample;
	writeln;

	tenTimesExample;
}

// Mutate the elements in the range [begin, end)
void tenTimes(int* begin, int* end)
{
	while (begin != end)
	{
		*begin *= 10;
		++begin;
	}
}

void forLoopExample()
{
	int[] values = [0, 1, 2, 3];
	int* begin = &values[1];
	int* end = begin + 2;

	// Using a for loop to iterate over the array
	for (; begin != end; ++begin)
	{
		*begin *= 10;
	}

	writeln("values after for loop: ", values);
}

void foreachLoopExample()
{
	int[] values = [0, 1, 2, 3];
	int* begin = &values[1];
	int* end = begin + 2;

	// Using foreach to iterate over the array
	foreach (ptr; begin .. end)
	{
		*ptr *= 10;
	}

	writeln("values after foreach loop: ", values);
}

void tenTimesExample()
{
	int[] values = [10, 11, 12, 13];
	int* begin = &values[0];
	int* end = begin + values.length;

	// Using the tenTimes function to mutate the array
	tenTimes(begin, end);

	writeln("values after tenTimes function: ", values);
}
