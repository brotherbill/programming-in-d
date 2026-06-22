import std.stdio: readf, writeln;

void main()
{
	writeln("Don't add spaces before: number or before colons");
	writeln("Type in:\nnumber: ###  grade: ###");

	int number;
	int grade;
	readf("number: %s grade: %s", &number, &grade);

	writeln("number: |", number, "|, grade: |", grade, "|");
}
