import std.stdio;

void main()
{
	writeln("DOUBLE QUOTED STRING LITERALS");
	string a = "Greetings\nWorld\&frac12;";
	writeln(a.stringof, ": ", a);
	writeln;

	writeln("WYSIWYG STRING LITERALS using backticks");
	writeln("Right way to write paths:");
	string b1 = `C:\new_project\app.d`;
	writeln(b1.stringof, ": ", b1);
	writeln;

	writeln("Wrong way to write paths:");
	string b2 = "C:\new_project\app.d";
	writeln(b2.stringof, ": ", b2);
	writeln;

	writeln("Multiline WYSIWYG string literal respects newlines, using r\"...\" :");
	string b3 = r"first line.
second line.
C:\path\to\nappy.d";
	writeln(b3.stringof, ": ", b3, "|");
	writeln;

	writeln("Multiline WYSIWYG string literal respects newlines, using backticks:");
	string b4 = `first line.
second line.
C:\path\to\happy.d`;
	writeln(b4.stringof, ": ", b4, "|");
	writeln;

/+ Compiles, but screen has too many squiggly lines.
	string singleCharDelim = q"^c:\path\to\file.txt^";
	writeln("Single character delimiter for WYSIWYG string literal :", singleCharDelim.stringof, ": ", singleCharDelim);
	string singleCharDelim2 = q"+c:\path\to\file2.txt+";
	writeln("Single character delimiter for WYSIWYG string literal:", singleCharDelim2.stringof, ": ", singleCharDelim2);
	writeln;
+/	

	string dsl = q"NOT_IN_BODY_OF_TEXT
first line
second line
NOT_IN_BODY_OF_TEXT";
	string regular = "first line\nsecond line\n";
	assert(dsl == regular);

	// This won't compile.  NOT_IN_BODY_OF_TEXT" must be on a line of its own
	/+
	string ds2 = q"NOT_IN_BODY_OF_TEXT
first line
second lineNOT_IN_BODY_OF_TEXT";
	+/

	writeln("Token string literal:");
	string token = q{ int number = 42;  ++number; };
	writeln(token.stringof, ": ", token);
	writeln;

	auto asciiString      = "*ascii*"c;
	auto wideString       = "*wideString*"w;
	auto doubleWideString = "*doubleWideString*"d;
	writeln("ASCII       string literal: ", asciiString, "            has type: ", asciiString.stringof);
	writeln("Wide        string literal: ", wideString, "       has type: ", wideString.stringof);
	writeln("Double wide string literal: ", doubleWideString, " has type: ", doubleWideString.stringof);
	writeln;
}
