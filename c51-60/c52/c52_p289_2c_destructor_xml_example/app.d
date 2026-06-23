import std.stdio : writeln;

void main() {
	import std.random : uniform;
	import std.conv  : to;

	immutable classes = XmlElement("classes", 0);

	foreach (classId; 0 .. 2) {
		immutable classTag = "class" ~ to!string(classId);
		immutable classElement = XmlElement(classTag, 1);

		foreach (i; 0..3) {
			immutable gradeElement = XmlElement("grade", 2);
			immutable randomGrade = uniform(50, 101); // Grades between 50 and 100

			 writeln(indentationString(3), randomGrade);
		}
	}
}

struct XmlElement {
	string name;
	string indentation;

	this(string name, int level) {
		this.name = name;
		this.indentation = indentationString(level);

		writeln(indentation, '<', name, '>');
	}

	~this() {
		writeln(indentation, "</", name, '>');
	}
}

string indentationString(int level) {
	import std.array : replicate;
	
	return replicate(" ", level * 2);
}
