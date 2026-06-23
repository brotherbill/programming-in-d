import std.stdio : writeln;

void main()
{
	MusicalInstrument[] orchestraInstruments;
	orchestraInstruments ~= new Violin;
	orchestraInstruments ~= new Flute();

	foreach (instrument; orchestraInstruments)
	{
		playInTune(instrument);
		writeln;
	}		
}

bool needsTuning(MusicalInstrument instrument)
{
	import std.random : uniform;

	bool result = uniform(0, 2) == 0; // Randomly returns true or false
	// ...
	return result;
}

void playInTune(MusicalInstrument instrument)
{
	if (needsTuning(instrument))
	{
		instrument.adjustTuning;
	}
	writeln("Sound emitted by instrument: ", instrument.emitSound);
}

class Musician
{
	MusicalInstrument instrument;
	// ...
}

class Violin : MusicalInstrument
{
	public string emitSound()
	{
		return "Violin sound";
	}
	
	public void adjustTuning()
	{
		writeln("Tuning the violin...");
	}
}

class Flute : MusicalInstrument
{
	public string emitSound()
	{
		return "Flute sound";
	}
	
	public void adjustTuning()
	{
		writeln("Tuning the flute...");
	}
}		

interface SoundEmitter
{
	string emitSound(); // Declared, but needs to be implemented by effective class
}

interface MusicalInstrument : SoundEmitter
{
	void adjustTuning();
}
