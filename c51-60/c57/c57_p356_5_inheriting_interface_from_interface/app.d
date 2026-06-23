import std.stdio : writeln;

void main()
{
	Violin violin = new Violin;
	writeln("violin.emitSound: ", violin.emitSound);
	violin.adjustTuning;
}

interface SoundEmitter
{
	string emitSound(); // Declared, but needs to be implemented by effective class
}

interface MusicalInstrument : SoundEmitter
{
	void adjustTuning();
}

class Violin : MusicalInstrument
{
	string emitSound()
	{
		// for SoundEmitter
		return "sweet Violin sound";
	}

	void adjustTuning()
	{
		// for MusicalInstument
		writeln("adjustTuning:     laaa, laaa, laaa");
	}
}
