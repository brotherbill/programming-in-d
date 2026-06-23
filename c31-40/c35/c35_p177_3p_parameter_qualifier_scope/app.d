import std.stdio : writeln;

int[] globalSlice;

void main()
{
	simple_tester();
	simple_ref_tester();
	simple_out_tester();
	sneaky_tester();
}

void simple_tester() {
	int[] slice = [10, 20];

	int[] result_simple = simple(slice);
	writeln("result_simple: ", result_simple);
}

@safe int[] simple(scope int[] parameter)
{
	// ← compilation ERROR.  
	// assigning scope variable `parameter` to global variable `globalSlice` is not allowed in a `@safe` function
	globalSlice = parameter; 	// parameter leaked out to globalSlice, breaking scope.

	// ← compilation ERROR.  
	// scope parameter `parameter` may not be returned
	return parameter; 			// parameter may not be returned, breaking scope.
}

void simple_ref_tester() {
	int[] slice = [10, 20];

	simple_ref(slice);
	writeln("result_ref:    ", slice);
}	

@safe void simple_ref(scope ref int[] parameter)
{
	// Explicit ref ignores scope, as ref means explicit scope escape.
	parameter[0] += 1;
}

void simple_out_tester() {
	int[] slice = [10, 20];

	simple_out(slice);
	writeln("result_out:    ", slice);
}	

@safe void simple_out(scope out int[] parameter)
{
	// Explicit out ignores scope, as out means explicit scope escape.
	parameter = [30, 40];
}

void sneaky_tester() {
	int[] slice = [10, 20];

	sneaky(slice);
	writeln("sneaky_tester: slice: ",       slice);
	writeln("sneaky_tester: globalSlice: ", globalSlice);
}

@safe void sneaky(scope int[] parameter)
{
	// ← compilation ERROR.  
	// assigning scope variable `parameter` to non-scope parameter `parameter` calling `modifyGlobalSlice` is not allowed in a `@safe` function
	modifyGlobalSlice(parameter); 

	// ← compilation ERROR.  
	// assigning scope variable `parameter` to non-scope parameter `__param_1` calling `writeln` is not allowed in a `@safe` function
	writeln("sneaky: ", parameter);		// parameter leaked out to writeln, breaking scope.
	writeln("sneaky: globalSlice: ", globalSlice);
}

@safe void modifyGlobalSlice(int[] parameter)
{
	globalSlice = parameter;	// parameter leaked out to globalSlice, breaking scope for calling function on line 70.
}
