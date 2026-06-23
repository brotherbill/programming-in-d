import std.stdio;

void main()
{
	int[] grades = [90, 65, 80, 72, 100, 65, 90];
	writeln("grades           : ", grades);

	auto gradesWithout65 = removed(grades, 65);
	writeln("grades without 65: ", gradesWithout65);
	writeln;

	string[] names = ["Bob", "Carol", "Ted", "Alice"];
	writeln("names            : ", names);

	auto namesWithoutTed = removed(names, "Ted");
	writeln("names without Ted: ", namesWithoutTed);
}

// Returns a copy of 'slice' except for the elements that are equal to 'value'
T[] removed(T)(const(T)[] slice, T value)
{
	T[] result;

	foreach (element; slice)
	{
		if (element != value)
		{
			result ~= element;
		}
	}

	return result;
}
