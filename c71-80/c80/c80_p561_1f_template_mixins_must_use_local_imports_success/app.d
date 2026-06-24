import std.stdio;

void main()
{
	import a_module; // avoid name collision with import a

	mixin A!int; // ← compilation success

	writeln(a);
}
