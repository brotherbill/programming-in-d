import std.stdio;
import std.array;

void main()
{
	char[] s = "hello".dup;
	s.front = 'H';			// ← Compilation ERROR.  s.front is not assignable.
}
