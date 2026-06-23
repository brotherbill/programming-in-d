import std.stdio;

void main()
{
	int a = 100;
	immutable int b = 20;

	writeln("--- auto ref: lvalue ---");
	writeln(" ", __LINE__, " a before                   : ", a);
	incrementByTen(a); 			// ← lvalue; passed by reference
	// incrementByTenWithReferenceSemantics(a); // ← lvalue; passed by reference
	writeln(__LINE__, " a after                    : ", a);
	assert(a == 110);
	writeln;

	writeln("--- auto ref: rvalue ---");
	a = 100; // reset
	writeln(__LINE__, " a before (a + b)           : ", a, ", b = ", b);
	incrementByTen(a + b); 		// ← rvalue; copied
	// incrementByTenWithValueSemantics(a + b); // ← rvalue; passed by copy
	assert(a == 100); 			// unchanged
	writeln(__LINE__, " a after (a + b)            : ", a, ", b = ", b);
}

void incrementByTen()(auto ref int value)
{
	/* WARNING: The parameter may be a copy if the argument is an rvalue. 
     * This means that the following modification may not be observable by the caller. 
     */

	static if (__traits(isRef, value))
	{
		// 'value' is passed by reference
		writeln(__LINE__, " value passed by REFERENCE  : ", value);
	}
	else
	{
		// 'value' is copied
		writeln(__LINE__, " value COPIED               : ", value);
	}

	writeln(__LINE__, " incrementByTen before value: ", value);
	value += 10;
	writeln(__LINE__, " incrementByTen after value : ", value);
}

// What compiler generates for the above function with reference semantics, ignoring comments and function name.
void incrementByTenWithReferenceSemantics(ref int value)
{
	writeln(__LINE__, " value passed by REFERENCE                        : ", value);
	writeln(__LINE__, " incrementByTenWithReferenceSemantics before value: ", value);
	value += 10;
	writeln(__LINE__, " incrementByTenWithReferenceSemantics after value : ", value);
}

// What compiler generates for the above function with copy semantics, ignoring comments and function name.
void incrementByTenWithValueSemantics(int value)
{
	writeln(__LINE__, "  value COPIED                                : ", value);
	writeln(__LINE__, " incrementByTenWithValueSemantics before value: ", value);
	value += 10;
	writeln(__LINE__, " incrementByTenWithValueSemantics after value : ", value);
}
