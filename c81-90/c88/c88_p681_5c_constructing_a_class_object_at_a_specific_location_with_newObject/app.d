import std.stdio     : writeln;
import std.algorithm : map;
import std.conv      : to;
import core.memory   : GC;
import mem_util      : nextAlignedAddress, sizeWithPadding;
import animals       : Animal, Cat, Parrot, NewObject;

void main()
{
	// A slice of Animal variables (not Animal objects)
	Animal[] animals;

	// Allocating a buffer with an arbitrary capacity and 
	// assuming that the two objects in this example will fit in that area.
	// Normally, this condition must be validated.
	const capacity = 10_000;
	void* buffer = GC.calloc(capacity);

	// Let's first place a Cat object. 
	void * addressAfterCat;
	Cat cat = NewObject!Cat.newObject(buffer, addressAfterCat);
	animals ~= cat;

	// Now construct a Parrot object at the next available
	// address that satisfies the alignment requirement. 
	void * addressAfterParrot;
	Parrot parrot = NewObject!Parrot.newObject(addressAfterCat, addressAfterParrot);
	parrot.lyrics = ["squawk", "aargh"];
	animals ~= parrot;

	// Use the objects. 
	foreach (animal; animals)
	{
		writeln(animal.sing());
	}
}
