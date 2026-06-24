import std.stdio;

void main()
{
	int  myVariable = 180;
	int* myPointer  = &myVariable;

	writefln("Value   of  myVariable: %d",    myVariable);
	writefln("Address of  myVariable: 0x%x",  myPointer);
	writefln("Value   of  myPointer : 0x%x",  myPointer);
	writefln("Address of  myPointer : 0x%x", &myPointer);
	writefln("Value   via myPointer : %d",   *myPointer);
}
