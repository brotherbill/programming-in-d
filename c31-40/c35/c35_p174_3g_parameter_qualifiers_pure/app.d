import std.stdio : writeln;

void main()
{
	double energy = 100;
	writeln("Original energy: ", energy);


	double lowerEnergy = reducedEnergy(energy);
	writeln("lowerEnergy      :  ", lowerEnergy);
}

// By using 'in', we guarantee that aEnergy cannot be modified within the function
double reducedEnergy(in double aEnergy) pure
in(aEnergy >= 0)
out(result; result == aEnergy / 4)
do
{
	double result = aEnergy / 4;
	debug writeln("reducedEnergy: aEnergy=", aEnergy, ", result=", result);  // writeln not allowed, as it is not a pure function

	pureFunction(); 	  // allowed, as it is a pure function, even though it does not return a value
	// nonPureFunction(); // won't compile, as it is not a pure function

	return result;
}
	
void pureFunction() pure
{
	
}

void nonPureFunction()
{
	
}
