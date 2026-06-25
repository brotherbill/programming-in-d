module animals;

interface Animal
{
    string sing();
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
