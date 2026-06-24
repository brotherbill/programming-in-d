import std.stdio;

void main() {
	char[] m; // has mutable elements
	m ~= "hello";
	writefln("parenthesized(m): %s", parenthesized(m));
}

string parenthesized(string phrase) {
	return '(' ~ phrase ~ ')';
}

char[] parenthesized(char[] phrase) {
	return '(' ~ phrase ~ ')';
}

const(char)[] parenthesized(const(char)[] phrase) {
	return '(' ~ phrase ~ ')';
}
