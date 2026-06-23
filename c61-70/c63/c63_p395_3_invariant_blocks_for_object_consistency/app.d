import std.stdio;
import school;

void main()
{
	School school = new School;
	Student aaron = {name: "Aaron", gender: Gender.male};
	Student mary  = {name: "Mary",  gender: Gender.female};
	Student beth  = {name: "Beth",  gender: Gender.female};

	school.add(aaron);
	school.add(mary);
	school.add(beth);

	writeln(school);
}
