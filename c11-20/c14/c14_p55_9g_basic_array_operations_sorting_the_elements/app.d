import std.stdio : writeln;
import std.algorithm : sort; // For array manipulation functions

void main()
{
	writeln("Sorting the elements in place with function call syntax");
	int[] numbers = [5, 3, 8, 1, 2, 4];
	writeln(" ", __LINE__, " Original numbers: ", numbers, " Length: ", numbers.length, " Capacity: ", numbers.capacity);

	sort(numbers);

	writeln(__LINE__, " Sorted numbers  : ", numbers, " Length: ", numbers.length, " Capacity: ", numbers.capacity);
	writeln();
	
	writeln("Sorting the elements in place with fluent call syntax");
	int[] numbers2 = [5, 3, 8, 1, 2, 4];
	writeln(__LINE__, " Original numbers2: ", numbers2, " Length: ", numbers2.length, " Capacity: ", numbers2.capacity);

	numbers2.sort();

	writeln(__LINE__, " Sorted numbers2  : ", numbers2, " Length: ", numbers2.length, " Capacity: ", numbers2.capacity);
}
