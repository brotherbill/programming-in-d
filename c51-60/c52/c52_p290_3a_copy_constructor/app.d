import std.stdio : writeln;

void main() {
	S mainS = S(20, 3.14, "Bob");
	writeln(" ", __LINE__, " main()   &mainS is ", &mainS, ", ", mainS);

	fooByValue(mainS);
	writeln;

	S sally = fooReturnByValue;
	writeln(__LINE__, " main()             &sally  is ", &sally, ", ", sally);

	S sally2; 		// construction
	writeln(__LINE__, "                    &sally2 is ", &sally2, ", ", sally2);

	sally2 = sally; // Copy assignment
	writeln(__LINE__, " main()             &sally2 is ", &sally2, ", ", sally2);
	writeln;

	copyObjectsExplicitly;
	writeln;
}

struct S {
	int    i;
	double d;
	string name;
}

void fooByValue(S s) {
	writeln(__LINE__, " fooByValue() &s is ", &s, ", ", s);
}

S fooReturnByValue() {
	S result = S(30, 2.71828, "Sally");
	writeln("Note compiler cleverness!  There is NO copy");
	writeln(__LINE__, " fooReturnByValue() &result is ", &result, ", ", result);
	return result;
}

void copyObjectsExplicitly() {
	auto existingObject = S();
	writeln(__LINE__, " copyObjectExplicitly()                    &existingObject is ", &existingObject, ", ", existingObject);

	auto a = existingObject;	
	writeln(__LINE__, " copyObjectExplicitly() copy construction: &a              is ", &a, ", ", a);

	a = existingObject;			
	writeln(__LINE__, " copyObjectExplicitly() assignment:        &a              is ", &a, ", ", a);

	a = a;						
	writeln(__LINE__, " copyObjectExplicitly() assignment:        &a              is ", &a, ", ", a);

	a = S();
	writeln(__LINE__, " copyObjectExplicitly() assignment:        &a              is ", &a, ", ", a);
}
