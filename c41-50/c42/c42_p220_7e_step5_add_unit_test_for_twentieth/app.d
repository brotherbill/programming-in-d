import std.exception : enforce;
import std.string    : format;
import std.stdio     : writefln;

void main()
{
	writefln("He came the %s in the race.", ordinalSpelled("twenty"));
}

dstring ordinalSpelled(dstring number)
{
	enforce(number.length, "number cannot be empty");

	dstring[dstring] exceptions = [
		"one": "first", "two": "second", "three": "third",
		"five": "fifth", "eight": "eighth", "nine": "ninth", "twelve": "twelfth"
	];
	dstring result;

	if (number in exceptions)
	{
		result = exceptions[number];
	}
	else
	{
		result = number ~ "th";
	}
	return result;
}

unittest
{
	assert(ordinalSpelled("one")    == "first");
	assert(ordinalSpelled("two")    == "second");
	assert(ordinalSpelled("three")  == "third");
	assert(ordinalSpelled("ten")    == "tenth");
	assert(ordinalSpelled("twenty") == "twentieth");
}
