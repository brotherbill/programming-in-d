import std.stdio;

void main()
{

}

string makeStruct(string name, string member)
{
	import std.format;

	return format!"struct %s {\n  int %s\n}"(name, member); // missing semicolon after: int %s
}

mixin(makeStruct("S", "m")); // ← compilation ERROR
