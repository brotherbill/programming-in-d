import std.stdio : writefln;
import std.range : empty;

void main()
{
	int[string] aa; // ← null to begin with
	writefln("Initially, aa                    : %s,          aa   is null?: %s,  aa   == null?: %s,  aa.empty?  : %-5s, aa.length  : %d", 
			 aa, aa is null, aa == null, aa.empty, aa.length);
	
	appendElement(aa);
	assert(aa is null); // still null
	writefln("After appendElement() returns, aa: %s,          aa   is null?: %s,  aa   == null?: %s,  aa.empty?  : %-5s, aa.length  : %d", 
			 aa, aa is null, aa == null, aa.empty, aa.length);
}

void appendElement(int[string] dict)
{
	assert(dict is null);
	dict["red"] = 100;
	writefln("Inside appendElement(), dict     : %s, dict is null?: %s, dict == null?: %s, dict.empty?: %-5s, dict.length: %d", 
			 dict, dict is null, dict == null, dict.empty, dict.length);
}
