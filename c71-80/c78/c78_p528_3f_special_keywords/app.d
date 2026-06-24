import std.stdio;

void main()
{
	func(42); // ← line 12
}

void func(T,
	string functionName = __FUNCTION__,
	string file = __FILE__,
	size_t line = __LINE__)(T parameter)
{
	writefln("Instantiated at function %s at file %s, line %s.", functionName, file, line);
}
