import std.stdio : writeln;

void main()
{
	useSoundEmittingObject(new Violin);
	useSoundEmittingObject(new Bell);
}

interface SoundEmitter
{
	string emitSound(); // Declared, but needs to be implemented by effective class
}

class Violin : SoundEmitter
{
	string emitSound()
	{
		return "sweet violin sounds";
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
