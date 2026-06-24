import std.stdio;

void main()
{
	funWithNewInt;
	funWithNewStruct;
	writeln;
	funWithNew;
}

void funWithNewInt()
{
	auto p = new int(42);
	writeln("p: ", p, ", *p: ", *p);
}

void funWithNewStruct()
{
	auto s = new MyStruct;
	s.a = 10;
	s.b = 3.14f;
	writeln("s: ", s, ", s.a: ", s.a, ", s.b: ", s.b, ", type: ", typeof(s).stringof);
}

void funWithNew()
{
	writeln(typeof(new int).stringof);
	writeln(typeof(new int[5]).stringof);
	writeln(typeof(new Struct).stringof);
	writeln(typeof(new Class).stringof);
}

struct MyStruct
{
	int a;
	float b;
}

struct Struct
{
}

class Class
{
}
