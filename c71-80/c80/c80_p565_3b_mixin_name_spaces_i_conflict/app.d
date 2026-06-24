import std.stdio;

void main()
{
	mixin Templ;
	mixin Templ;

	i = 42; // ← compilation ERROR
}

template Templ()
{
	int i;
}
