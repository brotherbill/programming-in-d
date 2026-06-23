import std.stdio;
import iface;
import my_class;

void main()
{
	auto c = new MyClass;

	// Although the following call fails Iface's precondition,
	//  it is accepted because it fulfills Class' precondition

	writeln(c.func([1, 2, 3], []));
}
