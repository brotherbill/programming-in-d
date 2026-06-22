import std.stdio : writeln;

void main()
{
	// value[key]             
	int[string] dayNumbers = 
	[
		// Key     : Value
		"Monday"   : 0, 
		"Tuesday"  : 1,  
		"Wednesday": 2, 
		"Thursday" : 3, 
		"Friday"   : 4, 
		"Saturday" : 5, 
		"Sunday"   : 6,
	];		

	writeln("Tuesday has value: ", dayNumbers["Tuesday"]); // prints 1
}
