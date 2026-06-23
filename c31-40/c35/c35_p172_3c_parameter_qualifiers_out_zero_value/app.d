import std.stdio : writeln;

void main()
{
	int variable = 100;

	writeln(" 7 Before calling the function      : ", variable);

	foo(/* out */ variable);
	writeln("10 After returning from the function: ", variable);
}

void foo(out int parameter)
{
	writeln("15 After entering the function      : ", parameter);
}
