void main() 
{
	auto musicalInstrument = new MusicalInstrument;
	auto stringInstrument  = new StringInstrument;
}

// ": Object" is not written; it is automatic
// If you insist, you can manually inherit from Object.
// But in real code, no one does.
class MusicalInstrument : Object 
{
	// ...
}

// Inherits Object indirectly
class StringInstrument : MusicalInstrument 
{
	// ...
}
