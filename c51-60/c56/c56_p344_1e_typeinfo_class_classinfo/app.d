import std.stdio;

void main()
{
	TypeInfo v = typeid(foo(1));
	TypeInfo g = typeid(foo(2));

	assert(v != g); // ← the two types are not the same

	writeln("v: ", v);
	writeln("g: ", g);
	writeln("v == g: ", v == g);
	writeln;

	TypeInfo_Class v2         = typeid(foo(1));
	
	string         className  = v2.name; 	 
	string         className2 = v.classinfo.name;
	string         baseName   = v2.base.name;
	string         baseName2  = v2.base.base.name;

	writeln("v2        : ", v2);
	writeln("className : ", className);
	writeln("className2: ", className2);
	writeln("baseName  : ", baseName);
	writeln("baseName2 : ", baseName2);
}

MusicalInstrument foo(int i)
{
	return (i % 2) ? new Violin : new Guitar;
}

class MusicalInstrument
{
}

class StringInstrument : MusicalInstrument
{
}

class Violin : StringInstrument
{
}

class Guitar : StringInstrument
{
}
