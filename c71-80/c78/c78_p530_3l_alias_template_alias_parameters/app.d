import std.stdio;

void main()
{
	string name;
	foo!name();

	int count;
	foo!count();

	double length;
	foo!length();
}

void foo(alias variable)()
{
	writefln("The general definition is using '%s' of type %s.",
		variable.stringof, typeof(variable).stringof);
}

void foo(alias int i)()
{
	writefln("The int specialization is using '%s'.", i.stringof);
}

void foo(alias double d)()
{
	writefln("The double specialization is using '%s'.", d.stringof);
}
