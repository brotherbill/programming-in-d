import std.stdio  : writeln;
import std.string : format;

void main()
{
	auto busArrival = TimeOfDay(8, 30);	// Construct a struct TimeOfDay

	auto variable = new SomeClass;  	// Construct a class instance of SomeClass (new is required, parentheses areoptional)
	writeln("variable: ", typeof(variable).stringof);
	writeln;

	/* More familiar syntax; immutable variable of a mutable type: */
	S mutA = S(1);						// Construct a struct S
	immutable a = mutA; 				// uses idup implicitly
	writeln("a: ", typeof(a).stringof, ", ", a);
	assert(a is mutA);					// For structs, `is` has value semantics.  a and mutA have the same values, so they are equivalent.
	mutA.simpletonCount = 10;			// Modify mutA.  a remains unchanged because it is immutable, and has its own copy of the data.
	assert(a !is mutA);					// For structs, `!is` has value semantics.  a and mutA have different values, so they are not equivalent.

	/* Type constructor syntax; a variable of an immutable type: */
	auto b = immutable(S)(2);			// Construct an immutable struct S, with parameter 2
	writeln("b: ", typeof(b).stringof, ", ", b);

	/* Same meaning as 'b' */
	immutable c = immutable(S)(3);		// Construct an immutable struct S, with parameter 3
	writeln("c: ", typeof(c).stringof, ", ", c);

	immutable d = S(4);				// Construct an immutable struct S, with parameter 4
	writeln("d: ", typeof(d).stringof, ", ", d);
}

struct TimeOfDay
{
	int hour;
	int minute;

	string toString() const
	{
		return format("%02s:%02s", hour, minute);
	}
}

struct S
{
	int simpletonCount;
}

class SomeClass
{

}
