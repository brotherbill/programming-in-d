import std.stdio     : writeln;
import std.algorithm : reverse; // For array manipulation functions

void main()
{
	writeln("Reversing the elements in place");
	writeln("Reversing the elements in place is efficient because it does not require additional memory allocation");
	writeln();

	int[] numbers = [5, 3, 8, 1, 2, 4];
	writeln(__LINE__, " Original numbers:                             ", numbers, " Length: ", numbers.length, " Capacity: ", numbers.capacity);

	reverse(numbers);
	writeln(__LINE__, " Reversed numbers        with function syntax: ", numbers, " Length: ", numbers.length, " Capacity: ", numbers.capacity);

	numbers.reverse(); 
	writeln(__LINE__, " Reversed numbers again, with fluent   syntax: ", numbers, " Length: ", numbers.length, " Capacity: ", numbers.capacity);
}
