import std.stdio : writeln, writefln;

void main()
{
	foreachByCopy;
	foreachByReference;
}

void foreachByCopy()
{
	double[] numbers = [1.2, 3.4, 5.6];

	writefln("By COPY Before: %s", numbers);

	foreach (number; numbers)
	{
		number *= 2;
	}

	writefln("By COPY After : %s", numbers);
	writeln;
}

void foreachByReference()
{
	double[] numbers = [1.2, 3.4, 5.6];

	writefln("By REFERENCE Before: %s", numbers);

	foreach (ref number; numbers)
	{
		number *= 2;
	}

	writefln("By REFERENCE After : %s", numbers);
}
