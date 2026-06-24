import std.stdio;
import std.net.curl;

// Not needed in DMD, but is needed for LDC and GDC:
pragma(lib, "curl");

void main()
{
	// Get this chapter
	writeln(get("ddili.org/ders/d.en/pragma.html"));
}
