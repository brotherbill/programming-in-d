import std.stdio : writeln;


void main()
{
	int main_in  = 10; 	// The value of main_in is copied to the parameter. 
	int main_ref = 20; 	// main_ref is passed to the function as itself. 
	int main_out = 30; 	// main_out is passed to the function as itself. 
				        // Its value is set to int.init upon entering the function. 

	// aCalculation() is NOT evaluated here.
	foo(main_in, main_ref, main_out, aCalculation());
	writeln(__LINE__, " main_ref: ", main_ref); // main_ref has been modified by foo().
	writeln(__LINE__, " main_out: ", main_out);
}

void foo(
	in   int p_in, 		// The lifetime of p_in starts upon entering the function and ends upon exiting the function. 
	ref  int p_ref, 	// p_ref is an alias of main_ref. 
	out  int p_out, 	// p_out is an alias of main_out. Its value is set to int.init upon entering the function. 
	lazy int p_lazy) 	// The lifetime of p_lazy starts when it is used and ends when its use ends.
{ 	
	writeln(__LINE__, " foo has p_in: ", p_in);
	writeln(__LINE__, " foo has p_ref: ", p_ref);
	p_ref += 5; // This modifies main_ref in main().
	writeln(__LINE__, " foo modified p_ref to: ", p_ref);

	// The lifetime of p_lazy starts when it is used and ends when its use ends. 
	// Its value is calculated by calling aCalculation() every time p_lazy is used in the function. 
	// ...
	p_out = p_lazy ^^ 2 + p_lazy; // aCalculation() will be evaluated twice
	writeln(__LINE__, " foo has p_out: ", p_out);
}

int aCalculation()
{
	int result = 0;
	result += 10;
	writeln(__LINE__, " aCalculation result: ", result);
	return result;
}
