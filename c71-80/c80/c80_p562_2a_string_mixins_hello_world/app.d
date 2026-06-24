void main()
{
	import std.stdio;

	mixin(`int i = 42;`);

	mixin(`writeln("Hello, World!");`);
	writeln("i: ", i);
}
