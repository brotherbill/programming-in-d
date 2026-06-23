void main()
{
	// Was in unit tests in book, moved here for simplicity
	auto duration = Duration(12);

	duration *= 4;
	assert(duration.minute == 48);

	duration /= 2;
	assert(duration.minute == 24);

	duration <<= 1;
	assert(duration.minute == 48);

	duration = 1 ~ 3;				// ~ not supported for integers.  D ain't JavaScript.
	assert(duration.minute == 13);

	// duration ~= 3;  // Invalid operator.  Can't append int to int.  D ain't JavaScript.
}

struct Duration
{
	int minute;

	ref Duration opUnary(string op)() if ((op == "++") || (op == "--"))
	{
		mixin(op ~ "minute;");
		return this;
	}

	ref Duration opOpAssign(string op)(int amount) // intentionally not constrained to +, -, *, / for demonstration purposes
	{
		mixin("minute " ~ op ~ "= amount;");
		return this;
	}
}
