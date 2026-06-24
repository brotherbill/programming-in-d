import std.stdio;
import std.typecons;

void main()
{
	auto a = tuple!("number", "message")(42, "hello");
	auto b = Tuple!(int, "number", string, "message")(42, "hello");

	writeln("by index 0 : ", a[0]);
	writeln("by .number : ", a.number);
	writeln("by index 1 : ", a[1]);
	writeln("by .message: ", a.message);
}
