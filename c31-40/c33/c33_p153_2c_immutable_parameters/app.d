import std.stdio : writeln;

void main()
{
	immutable_tester;
	const_tester;
	mutable_tester;
}

void myImmutableFunction(immutable int[] slice)
{
	writeln("myImmutableFunction: ", slice);
}

void immutable_tester()
{
	writeln(__LINE__, " --- immutable_tester ---");

	immutable int []  immSlice1 = [1, 2];
	immutable(int)[]  immSlice2 = [3, 4];
	immutable(int []) immSlice3 = [5, 6];

	immSlice1.myImmutableFunction;
	immSlice2.myImmutableFunction;
	immSlice3.myImmutableFunction;
	writeln;

	writeln(__LINE__, " immSlice1: ", typeof(immSlice1).stringof);
	writeln(__LINE__, " immSlice2: ", typeof(immSlice2).stringof);
	writeln(__LINE__, " immSlice3: ", typeof(immSlice3).stringof);

	// These won't compile.  Can't reassign an immutable slice
	//immSlice1 = [1, 2, 3];
	//immSlice3 = [1, 2, 3];

	// These won't compile.  Can't change an immutable int
	// immSlice1[0] = 10;
	// immSlice2[0] = 10;
	// immSlice3[0] = 10;

	// These won't compile.  Can't change an immutable array
	// immSlice1 ~= 100;
	// immSlice3 ~= 100;

	// These will compile
	writeln(__LINE__, " Reassigning immSlice2 and modifying it");
	immSlice2 = [1, 2, 3];
	immSlice2 ~= 100;
	writeln;
}

void const_tester()
{
	writeln(__LINE__, " --- const_tester ---");

	const int []  constSlice1 = [1, 2];
	const(int)[]  constSlice2 = [3, 4];
	const(int []) constSlice3 = [5, 6];

	// These won't compile
	// constSlice1.myImmutableFunction;
	// constSlice2.myImmutableFunction;
	// constSlice3.myImmutableFunction;

	writeln(__LINE__, " constSlice1: ", typeof(constSlice1).stringof);
	writeln(__LINE__, " constSlice2: ", typeof(constSlice2).stringof);
	writeln(__LINE__, " constSlice3: ", typeof(constSlice3).stringof);

	// These won't compile.  Can't reassign to another int slice.
	// constSlice1 = [1, 2, 3];
	// constSlice3 = [1, 2, 3];

	// These won't compile.  Can't change any int in array
	// constSlice1[0] = 10;
	// constSlice3[0] = 10;

	// These won't compile.  Can't change array
	// constSlice1 ~= 100;
	// constSlice3 ~= 100;

	// These will compile
	writeln("Reassigning constSlice2 and modifying it");
	constSlice2 = [1, 2, 3];
	constSlice2 ~= 100;
	writeln;
}

void mutable_tester()
{
	writeln(__LINE__, " --- mutable_tester ---");

	int[] mutSlice = [1, 2];

	// This won't compile, as mutSlice is not an immutable int slice.
	// mutSlice.myImmutableFunction();

	writeln(__LINE__, " mutSlice: ", typeof(mutSlice).stringof);

	// These will compile
	mutSlice = [1, 2, 3];
	mutSlice[0] = 10;
	mutSlice ~= 100;
	mutSlice = [1, 2, 3];
}
