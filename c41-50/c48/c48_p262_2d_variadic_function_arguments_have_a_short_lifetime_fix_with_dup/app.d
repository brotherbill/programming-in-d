import std.stdio;

int[] numbersForLaterUse;

void main()
{
	bar();

	writeln("main() numbersForLaterUse: ", numbersForLaterUse);
}

void foo(int[] numbers...)
{
	numbersForLaterUse = numbers.dup; // ← correct
}

struct S
{
	string[] namesForLaterUse;

	void foo(string[] names...)
	{
		namesForLaterUse = names.dup; // ← correct
	}
}

void bar()
{
	foo(1, 10, 100); /* The temporary array [ 1, 10, 100 ] is not valid beyond this point. */
	writeln("bar() numbersForLaterUse: ", numbersForLaterUse);

	auto s = S();

	s.foo("hello", "world"); /* The temporary array [ "hello", "world" ] is not valid beyond this point. */
	writeln("bar() numbersForLaterUse: ", numbersForLaterUse);
	writeln("s.foo() s.namesForLaterUse: ", s.namesForLaterUse);
	// ...
}
