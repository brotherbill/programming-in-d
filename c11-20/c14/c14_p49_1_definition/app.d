import std.stdio;

void main()
{
	int       singleValue;
	int[10]   arrayOfTenValues; // Array of 10 integers [0] .. [9].  Fixed size array, may not be resized.

	double[5] values; 		    // Array of 5 doubles [0] .. [4].    Fixed size array, may not be resized.

	// An array that holds the weather information of all cities.
	// Here, the bool values may mean:
	//   false: overcast
	//   true : sunny
	const uint cityCount = 5; // Number of cities.  Must be a compile-time constant.
	bool[cityCount] weatherConditions;

	// An array that holds the weights of a hundred boxes
 	double[100] boxWeights;

	 // Information about the students of a school
	immutable uint studentCount = 30; // Number of students in the school.  Must be a compile-time constant.
 	StudentInformation[studentCount] studentInformation;

	// An enum defines a literal constant, which is substituted at compile time.
	// For this reason, you may not take the address of an enum value, as it does not exist at runtime.
	enum arraySize = 42;
	int[arraySize] myArray; // Array of 42 integers [0] .. [41].  Fixed size array, may not be resized.	
}

// A structure to hold information about a student. (This will be covered later)
struct StudentInformation
{
	string name;
	int    age;
	double gpa;
}
