import std.stdio : writeln;
import std.string : format;

void main()
{
	mixin(format!"const a = %s;"(int.sizeof)); // Same as above
	writeln("a: ", a);
}
