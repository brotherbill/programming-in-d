import std.stdio : writeln;

void main()
{
	string[] fruits = ["apple", "banana", "cherry", "durian"];

	writeln("iterating through fruits dynamic array (slice)");
	writeln("fruits[0]: ", fruits[0]);
	writeln("fruits[1]: ", fruits[1]);
	writeln("fruits[2]: ", fruits[2]);
	writeln("fruits[3]: ", fruits[3]);
	writeln;

	string[int] aaFruits;
	writeln("aaFruits is initially null? ", aaFruits is null);

	aaFruits[0] = "Apple";
	writeln("aaFruits is null after assignment? ", aaFruits is null, ", length of aaFruits: ", aaFruits.length);
	writeln;
	
	// Let's empty the array and see if is becomes null again
	aaFruits.remove(0);  // Remove key/value pair with key 0 and value "Apple".
	writeln("*** To test if dictionary is empty, use .length property, not comparison to null ***");
	writeln("aaFruits is null after removing Apple? ", aaFruits is null, ", length of aaFruits: ", aaFruits.length);

	// Put Apple back in and add more fruits
	aaFruits[0] = "Apple";
	aaFruits[1] = "Banana";
	aaFruits[2] = "Cherry";
	aaFruits[3] = "Durian";
	writeln("aaFruits is null after adding additional fruits? ", aaFruits is null, ", length of aaFruits: ", aaFruits.length);
	writeln;

	writeln("iterating through aaFruits associative array.  key is int, value is string");
	writeln("Capitalized fruits to make it clear that there's no cheating");
	writeln("Note the similar syntax to array lookups");
	writeln;

	writeln("aaFruits[0]: ", aaFruits[0]);
	writeln("aaFruits[1]: ", aaFruits[1]);
	writeln("aaFruits[2]: ", aaFruits[2]);
	writeln("aaFruits[3]: ", aaFruits[3]);
	writeln;

	writeln("Let's make this a SPARSE associative array, that is, an array with lots of gaps");
	aaFruits[20_000] = "Grapes";

	writeln("aaFruits[20_000]: ", aaFruits[20_000]);
}
