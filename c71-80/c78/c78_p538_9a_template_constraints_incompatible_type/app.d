import std.stdio;

void main()
{
    useSoundEmittingObject(new Violin);
    useSoundEmittingObject(new Bell);
    useSoundEmittingObject(new Car);
    useSoundEmittingObject(new Cup);
}

interface SoundEmitter
{
    string emitSound();
}

void useSoundEmittingObject(T)(T object)
{
    // ... some operations ...
    writeln(object.emitSound());
    // ... more operations ...
}

class Cup
{
    // ... does not have emitSound()
}

class Car
{
    string emitSound()
    {
        return "honk honk";
    }
}

class Violin : SoundEmitter
{
    string emitSound()
    {
        return "smooth violin sound";
    }
}

class Bell : SoundEmitter
{
    string emitSound()
    {
        return "ding";
    }
}
