import std.stdio : writefln;
import std.conv  : to;

void main() 
{
	auto myViolin      = new Violin("Stradavarious");
	auto improvisation = new MusicalPiece("Twinkle twinkle little star");
	playInTune(myViolin, improvisation);
}

// Vanilla function
void playInTune(MusicalInstrument instrument, MusicalPiece piece) 
{
	instrument.tune();
	instrument.play(piece);
}

abstract class MusicalInstrument 
{
	string name;

	this(string name) 
	{
		this.name = name;
	}

	void tune() 
	{
		writefln("Tuning %s.", toString);
	}

	void play(MusicalPiece piece) 
	{
		writefln("Playing %s on %s.", piece.name, toString);
	}

	override string toString() const 
	{
		return name;
	}
}

class MusicalPiece 
{
	string name;

	this(string name) 
	{
		this.name = name;
	}

	override string toString() const 
	{
		return name;
	}
}

abstract class StringInstrument : MusicalInstrument 
{
	this(string name) 
	{
		super(name);
	}
}

class Violin : StringInstrument 
{
	this(string name) 
	{
		super(name);
	}
	
	override string toString() const 
	{
		return super.toString ~ " Violin";
	}
}

class Guitar : StringInstrument 
{
	this(string name) 
	{
		super(name);
	}
}

abstract class WindInstrument : MusicalInstrument 
{
	this(string name) 
	{
		super(name);
	}
}

class Flute : WindInstrument 
{
	this(string name) 
	{
		super(name);
	}
}

class Recorder : WindInstrument 
{
	this(string name) 
	{
		super(name);
	}
}
