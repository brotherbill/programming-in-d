import std.parallelism;

void main()
{
	auto tasks = [task!foo(1), task!bar(2)]; // ← compilation ERROR
}

double foo(int i)
{
	return i * 1.5;
}

double bar(int i)
{
	return i * 2.5;
}
