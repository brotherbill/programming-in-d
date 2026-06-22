import std.stdio;

void main()
{
	char_test();
	wchar_test();
	dchar_test();
}

void char_test() {
	writeln("--- char_test with Unicode-8 ---");
	string grinning_face = "😀"; // U+1F600 Grinning Face 
	string e_acute       = "é"; // U+00E9 Latin Small Letter E with Acute
	string resume        = "résumé";
	string resume_emoji  = "résumé" ~ grinning_face;
	writeln(grinning_face ~ ".length is ", grinning_face.length);
	writeln(e_acute ~ ".length is ", e_acute.length);
	writeln(resume ~ ".length is ", resume.length);
	writeln(resume_emoji ~ ".length is ", resume_emoji.length);
	writeln("12 = (4 * 1) Unicode-8 characters, (2 * 2) Unicode-16 characters, and (1 * 4) Unicode-32 character.");

	char[] s = resume.dup;
	writeln("Before: ", s);
	s[1] = 'e';
	s[5] = 'e';
	writeln("After : ", s);
	writeln();
}

void wchar_test() {
	writeln("--- wchar_test with Unicode-16 ---");
	wstring grinning_face = "😀"; // U+1F600 Grinning Face 
	wstring resume        = "résumé"w ~ grinning_face;
	writeln(resume ~ ".length is ", resume.length);
	writeln("8 = (6 * 1) Unicode-16 characters, (1 * 2) Unicode-32 character.");

	wchar[] s = resume.dup;
	writeln("Before: ", s);
	s[1] = 'e';
	s[5] = 'e';
	writeln("After : ", s);
	writeln();
}

void dchar_test() {
	writeln("--- dchar_test with Unicode-32 ---");
	dstring grinning_face = "\U0001F600"d; // U+1F600 Grinning Face.  Underbar separator character not welcome here.  Must have 8 hex digits.
	dstring resume        = "résumé"d ~ grinning_face;
	writeln(resume ~ ".length is ", resume.length);
	writeln("7 = (7 * 1) Unicode-32 characters.");

	dchar[] s = resume.dup;
	writeln("Before: ", s);
	s[1] = 'e';
	s[5] = 'e';
	writeln("After : ", s);
	writeln();
}
