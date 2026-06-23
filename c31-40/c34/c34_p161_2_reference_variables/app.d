import std.stdio : writeln;

void main()
{
	ref_in_foreach_loops;
	ref_and_out_function_parameters_tester;
}

void ref_in_foreach_loops()
{
	int[] slice = [0, 1, 2, 3, 4];

	foreach (i, ref element; slice)
	{
		element *= 10;
		assert(&element == &slice[i]);
	}
	writeln(__LINE__, " ref_in_foreach_loops: ", slice);
	writeln;
}

void ref_and_out_function_parameters_tester()
{
	int originalVariable = 10;
	writeln(__LINE__, " ref_and_out_function_parameters_tester before ref_parameter_tester - address of originalVariable: ", &originalVariable, ", originalVariable: ", originalVariable);
	writeln;

	ref_parameter_tester(/+ ref +/ originalVariable);
	writeln(__LINE__, " ref_and_out_function_parameters_tester after ref_parameter_tester  - address of originalVariable: ", &originalVariable, ", originalVariable: ", originalVariable);	
	writeln;

	out_parameter_tester(/+ out +/ originalVariable);
	writeln(__LINE__, " ref_and_out_function_parameters_tester after out_parameter_tester  - address of originalVariable: ", &originalVariable, ", originalVariable: ", originalVariable);
}

void ref_parameter_tester(ref int refParameter)
{
	writeln(__LINE__, " ref_parameter_tester before - address of refParameter    : ", &refParameter, ", refParameter: ", refParameter);
	refParameter *= 2;
	writeln(__LINE__, " ref_parameter_tester after  - address of refParameter    : ", &refParameter, ", refParameter: ", refParameter);
}

void out_parameter_tester(out int outParameter)
{
	writeln(__LINE__, " out_parameter_tester before - address of outParameter    : ", &outParameter, ", outParameter: ", outParameter);
	outParameter = 30;
	writeln(__LINE__, " out_parameter_tester after  - address of outParameter    : ", &outParameter, ", outParameter: ", outParameter);
	writeln;
}
