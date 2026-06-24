import std.stdio;

void main()
{
	useSoundEmittingObject(new Violin);
	useSoundEmittingObject(new Bell);
}

interface SoundEmitter
{
	string emitSound();
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

void useSoundEmittingObject(SoundEmitter object)
{
	// ... some operations ...
	writeln(object.emitSound());
	// ... more operations ...
}
