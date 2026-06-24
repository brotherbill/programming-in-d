import std.stdio;

void main()
{
	foo(1.5, 2.0, () => 2.5); // 'double' passed as delegate
}

void foo(double delegate()[] args...)
{
	foreach (arg; args)
	{
		writeln(arg()); // Calling each delegate
	}
}
