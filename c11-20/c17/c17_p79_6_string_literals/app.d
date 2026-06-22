import std.stdio : writeln;

void main()
{
	string  s = "résumé"c; // same as "résumé"
	wstring w = "résumé"w;
	dstring d = "résumé"d;

	writeln(" string s.length: ", s.length);
	writeln("wstring w.length: ", w.length);
	writeln("dstring d.length: ", d.length);
}
