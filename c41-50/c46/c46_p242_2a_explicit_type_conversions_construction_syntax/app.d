import std.stdio : writeln;

void main()
{
	immutable int i = 9;

	const     result_construction_syntax =      double(i) / 2;	// construction expression
	immutable result_cast_syntax         = cast(double)i  / 2;	// cast expression

	writeln("result_construction_syntax: ", result_construction_syntax);
	writeln("result_cast_syntax        : ", result_cast_syntax);
}
