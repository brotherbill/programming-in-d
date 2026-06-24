import std.stdio;
import std.string;

void func(A, B)(A a, B b)
{
	writefln("Before pragma a = %s, b = %s", a, b);

	pragma(msg, format("Called with types '%s' and '%s'", A.stringof, B.stringof));

	writefln("After pragma a = %s, b = %s", a, b);
}

void main()
{
	func(42, 1.5);
	func("hello", 'a');
}
