void main()
{

}

interface SoundEmitter
{
	string emitSound(); // Declared, but needs to be implemented by effective class
}

interface I
{
	int func(int i)
	in
	{
		// Strictest requirements that the callers of this function must meet.
		// (Derived interfaces and classes can loosen these requirements.)
	}
	out
	{ // optionally with (result) parameter
		// Exit guarantees that the implementation of this function must give.
		// (Derived interfaces and classes can give additional guarantees)
	}
}
