import std.stdio : writeln;

void main()
{
	Phone phone = new Phone;
	writeln(phone.emitSound);
	writeln;

	phone.talk("Greetings Momma.");
	writeln("listening: ", phone.listen);
}

interface SoundEmitter
{
	string emitSound(); // Declared, but needs to be implemented by effective class
}

interface CommunicationDevice
{
	void   talk(string message);
	string listen();
}

class Phone : SoundEmitter, CommunicationDevice
{
	string emitSound()
	{ // for SoundEmitter
		return "rrring";
	}

	void talk(string message)
	{ // for CommunicationDevice
		// ... put the message on the line ...
		writeln("talk:      ", message);
	}

	string listen()
	{ // for CommunicationDevice
		string soundOnTheLine;

		// ... get the message from the line ...
		soundOnTheLine = "Son, would you like to come over for some fresh Apple Pie?";

		return soundOnTheLine;
	}
}
