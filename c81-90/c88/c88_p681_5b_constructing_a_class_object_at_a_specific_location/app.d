import std.stdio     : writeln;
import std.algorithm : map;
import std.conv      : emplace;
import core.memory   : GC;
import mem_util      : nextAlignedAddress;
import animals       : Animal, Cat, Parrot;

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
    void* catCandidateAddr = buffer;
    void* catAddr = nextAlignedAddress!Cat(catCandidateAddr);
    writeln("Cat address   : ", catAddr);

    // Since emplace() requires a void[] for a class object,
    // we must first produce a slice from the pointer.
    size_t catSize = __traits(classInstanceSize, Cat);
    void[] catPlace = catAddr[0 .. catSize];

    // Construct a Cat object inside that memory slice and
    // store the returned class variable for later use.
    Cat cat = emplace!Cat(catPlace);
    animals ~= cat;

    // Now construct a Parrot object at the next available
    // address that satisfies the alignment requirement.
    void* parrotCandidateAddr = catAddr + catSize;
    void* parrotAddr = nextAlignedAddress!Parrot(parrotCandidateAddr);
    writeln("Parrot address: ", parrotAddr);

    size_t parrotSize = __traits(classInstanceSize, Parrot);
    void[] parrotPlace = parrotAddr[0 .. parrotSize];

    Parrot parrot = emplace!Parrot(parrotPlace, ["squawk", "arrgh"]);
    animals ~= parrot;

    // Use the objects.
    foreach (animal; animals)
    {
        writeln(animal.sing());
    }
}
