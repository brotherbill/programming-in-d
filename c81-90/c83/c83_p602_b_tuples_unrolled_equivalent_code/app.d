import std.stdio;
import std.typecons;

void main()
{
	auto t = tuple(42, "hello", 1.5);

	{
		enum size_t i = 0;
		int member = t[i];
		writefln("%s: %s", i, member);
	}
	{
		enum size_t i = 1;
		string member = t[i];
		writefln("%s: %s", i, member);
	}
	{
		enum size_t i = 2;
		double member = t[i];
		writefln("%s: %s", i, member);
	}
}
