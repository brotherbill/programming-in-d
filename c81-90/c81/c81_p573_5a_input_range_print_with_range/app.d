import std.stdio;

void main()
{
	auto grades = new MyInputRange!int;
	grades.add(75);
	grades.add(85);
	grades.add(60);
	grades.add(100);

	print(grades);
	writeln("grades: ", grades.items);
}

void print(T)(T range)
{
	range.reset;

	for (; !range.empty; range.popFront())
	{
		write(' ', range.front);
	}

	writeln();
}

class MyInputRange(T)
{
	T[] items;
	T[] surrogate;

	void add(T item)
	{
		items ~= item;
	}

	void reset()
	{
		surrogate = items;
	}

	bool empty()
	{
		return surrogate.length == 0;
	}

	T front()
	in
	{
		assert(!empty);
	}
	do
	{
		return surrogate[0];
	}

	void popFront() 
	in
	{
		assert(!empty);
	}
	do
	{
		surrogate = surrogate[1 .. $];
	}
	
}
