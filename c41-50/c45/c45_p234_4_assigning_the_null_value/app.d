import std.stdio;

void main()
{
	auto variable  = new MyClass;
	auto variable2 = variable; // both reference same MyClass object.

	variable  = null; // now only variable2 reference original MyClass object
	variable2 = null; // now neither variable1 nor variable2 reference original myClass object, which now has no references to it, so it may be garbage collected

	string[int] names = [10: "ten", 15: "fifteen"];
	names = null; // names has no key value pairs, and "is" null.
	writeln("names: ", names, " length: ", names.length, ", is null: ", names is null);

	int[] otherSlice = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
	int[] slice      = otherSlice;
	slice = null; // slice doesn't reference any part of otherSlice, which continues to have 10 elements as before.

	writeln("otherSlice: ", otherSlice);
}

class MyClass
{
	int member;
}
