void main()
{
	// Was in unit tests in book, moved here for simplicity
	auto duration = Duration(10);

	++duration;
	assert(duration.minute == 11);

	--duration;
	assert(duration.minute == 10);

	duration += 5;
	assert(duration.minute == 15);

	duration -= 3;
	assert(duration.minute == 12);
}

struct Duration
{
	int minute;

	ref Duration opUnary(string op)() if ((op == "++") || (op == "--"))
	{
		mixin(op ~ "minute;");
		return this;
	}

	ref Duration opOpAssign(string op)(int amount) if ((op == "+") || (op == "-"))
	{
		mixin("minute " ~ op ~ "= amount;");
		return this;
	}
}
