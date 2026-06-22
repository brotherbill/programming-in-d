import std.stdio;

void main()
{
	char  c  = 'A';
	wchar wc = 'W';
	dchar dc = 'D';
	
	writeln("Unicode char  c  has ", c.sizeof,  " byte");
	writeln("Unicode wchar wc has ", wc.sizeof, " bytes");
	writeln("Unicode dchar dc has ", dc.sizeof, " bytes");
}
