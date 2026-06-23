void main() 
{
	// Although it is named as 'array' here, this variable is a slice as well. 
	// It provides access to all of the initial elements:
	int[] array = [0, 1, 2, 3, 4];

	// A slice that provides access to elements other than the first and the last:
	int[] slice = array[1 .. $ - 1];

	// At this point slice[0] and array[1] provide access to the same value:
	assert(&slice[0] == &array[1]);

	// Changing slice[0] changes array[1]:
	slice[0] = 42;
	assert(array[1] == 42);

	int[] slice2 = slice;
	// addresses must be different as each slice is independent of the other, and can each change length or change elements or append elements
	assert(&slice != &slice2);

	auto variable  = new MyClass;
	auto variable2 = variable;
	assert(variable is variable2); 		// each references same new MyClass
										// each reference at different location
	assert(&variable != &variable2); 	// each reference may independently change its target MyClass variable, possibly to null

	modify_member_of_the_object;
	fun_with_associative_arrays;
	fun_with_value_assignment;
	fun_with_slices;
	fun_with_my_class;
	fun_with_unassigned_class;
}

class MyClass 
{
	int member;
}

void modify_member_of_the_object() 
{
	auto variable = new MyClass;
	variable.member = 1;

	auto variable2 = variable; // They share the same object
	variable2.member = 2;

	assert(variable.member == 2); // The object that variable provides access to has changed.
}

void fun_with_associative_arrays() 
{
	string[int] byName = [
		1:   "one",
		10:  "ten",
		100: "hundred",
	];

	// The two associative arrays will be sharing the same set of elements
	string[int] byName2 = byName;

	// The mapping added through the second ...
	byName2[4] = "four";

	// ... is visible through the first.
	assert(byName[4] == "four");
}

void fun_with_value_assignment() 
{
	int number = 8;
	halve(/+ ref +/ number); // The actual referenced value changes
	assert(number == 4);
}

void halve(ref int dividend) 
{
	dividend /= 2;
}

void fun_with_slices() 
{
	int[] slice1 = [10, 11, 12, 13, 14];
	int[] slice2 = [20, 21, 22];

	int[] slice3 = slice1[1 .. 3]; // Access to element 1 and element 2 of slice1  [11, 12]

	slice3[0] = 777;
	assert(slice1 == [10, 777, 12, 13, 14]);

	// This assignment does not modify the elements that slice3 is currently providing access to. 
	// It makes slice3 provide access to slice 2 last element, losing its prior access to slice1
	slice3 = slice2[$ - 1 .. $]; // Access to the last element  [22]
	slice3[0] = 888;			 // Changes slice2[2] to 888
	assert(slice2 == [20, 21, 888]);
}

void fun_with_my_class() 
{
	auto variable1 = new MyClass;
	variable1.member = 1;

	auto variable2 = new MyClass;
	variable2.member = 2;

	auto aCopy = variable1;  // aCopy and variable1 share same instance
	aCopy.member = 3;		 // aCopy.member == 3; variable1.member == 3

	aCopy = variable2;		 // aCopy and variable2 share same instance
	aCopy.member = 4;		 // aCopy.member == 4; variable2.member == 4

	assert(variable1.member == 3);
	assert(variable2.member == 4);
}

void fun_with_unassigned_class() 
{
	MyClass myClass1;
	MyClass myClass2;

	assert(myClass1 is null);
	assert(myClass2 is null);
	assert(myClass1 is myClass2);     // If both are null they are equivalent
}
