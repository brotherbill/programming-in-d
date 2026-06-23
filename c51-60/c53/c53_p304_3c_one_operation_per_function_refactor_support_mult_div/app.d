void main()
{
	// Was in unit tests in book, moved here for simplicity
	auto duration = Duration(12);

	duration *= 4;
	assert(duration.minute == 48);

	duration /= 2;
	assert(duration.minute == 24);
}

struct Duration
{
	int minute;

	ref Duration opUnary(string op)() if ((op == "++") || (op == "--"))
	{
		mixin(op ~ "minute;");
		return this;
	}

	ref Duration opOpAssign(string op)(int amount) if ((op == "+") || (op == "-") || op == "*" || op == "/")
	{
		mixin("minute " ~ op ~ "= amount;");
		return this;
	}
}
