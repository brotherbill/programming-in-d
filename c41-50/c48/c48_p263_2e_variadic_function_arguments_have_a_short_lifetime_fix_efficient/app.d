import std.stdio;

int[] numbersForLaterUse;

void main()
{
	bar();
	writeln(" ", __LINE__, " numbersForLaterUse: ", numbersForLaterUse);
}

void foo(int[] numbers...)
{
	// Since this is the variadic version of foo(), we must first take a copy of the elements before storing a slice to them
	numbersForLaterUse = numbers.dup;
}

void foo(int[] numbers)
{
	// Since this is the non-variadic version of foo(), we can store the slice as is
	numbersForLaterUse = numbers;
}

struct S
{
	string[] namesForLaterUse;


	void foo(string[] names...)
	{
		// Since this is the variadic version of S.foo(), we must first take a copy of the elements before storing a slice to them
		namesForLaterUse = names.dup;
	}


	void foo(string[] names)
	{
		// Since this is the non-variadic version of S.foo(), we can store the slice as is
		namesForLaterUse = names;
	}
}

void bar()
{
	// This call is dispatched to the variadic function.
	foo(1, 10, 100);
	writeln(__LINE__, " bar() foo(1, 10, 100): ", numbersForLaterUse);

	// This call is dispatched to the proper slice function.
	foo([2, 20, 200]);
	writeln(__LINE__, " bar() foo([2, 20, 200]): ", numbersForLaterUse);

	auto s = S();

	// This call is dispatched to the variadic function.
	s.foo("hello", "world");
	writeln(__LINE__, " s.foo(hello, world) s.namesForLaterUse: ", s.namesForLaterUse);

	// This call is dispatched to the proper slice function.
	s.foo(["hi", "moon"]);
	writeln(__LINE__, " s.foo([hi, mom]) s.namesForLaterUse: ", s.namesForLaterUse);

	// ...
}
