import std.stdio;
import a;

void main()
{
	mixin A!int; // ← compilation ERROR
}
