module animals;

interface Animal
{
    string sing();
}

template NewObject(T : Animal)
{
    import core.memory : GC;
    import core.lifetime : emplace;
    import mem_util : nextAlignedAddress;

    T newObject(void* buffer, out void* nextAddress)
    {
        void* animalCandidateAddr = buffer;
        void* animalAddr = nextAlignedAddress!T(animalCandidateAddr);
        size_t animalSize = __traits(classInstanceSize, T);
        void[] animalPlace = animalAddr[0 .. animalSize];
        T animal = emplace!T(animalPlace);

        nextAddress = animalAddr + animalSize;
        return animal;
    }

}

class Cat : Animal
{
    string sing()
    {
        return "meow";
    }
}

class Parrot : Animal
{
    string[] lyrics;

    this() {
        
    }

    this(string[] lyrics)
    {
        this.lyrics = lyrics;
    }

    string sing()
    {
        import std.conv : to;
        import std.algorithm : joiner;

        // std.algorithm.joiner joins elements of a range with the specified separator
        return lyrics.joiner(", ").to!string;
    }
}
