import std.stdio : readf, write, writeln, writefln;
import std.random : uniform;

void main()
{
	int total = 42;
	++total;
	immutable half = total / 2; // total is run time

	// random number between 1 and 10 inclusive
	immutable target = uniform(min, max + 1); // target is run time

	enum min = 1;
	enum max = 10;
	writefln("I am thinking of a number between %s and %s.", min, max);

	auto isCorrect = false;
	while (!isCorrect)
	{
		immutable guess = readInt("What is your guess");
		isCorrect = (guess == number);
	}

	writeln("Correct!");
	writeln;

	immutable         a = [42, 100];
	immutable  int[]  b = [42, 100];
	immutable (int)[] c = [42, 100];
	// immutable int([]) d = [42, 100];	// Invalid syntax
	immutable (int[]) e = [42,100];
	// a = [ 100, 42 ]; // Compile ERROR
	// a[0] = 99;  	  	// Compile ERROR
	// a ~= 86;		  	// Compile ERROR

	immutable      inferredType = 0;
	immutable int  explicitType = 1;
	immutable(int) fullType     = 2;

	writeln("inferredType: ", typeof(inferredType).stringof);
	writeln("explicitType: ", typeof(explicitType).stringof);
	writeln("fullType    : ", typeof(fullType).stringof);
	writeln("a (inferred): ", typeof(a).stringof, ", can't change any int, nor array");
	writeln("b int[]     : ", typeof(b).stringof, ", can't change any int, nor array");
	writeln("c (int)[]   : ", typeof(c).stringof, ", can't change any int, may change array by appending or changing length");
	writeln("e (int[])   : ", typeof(e).stringof, ", can't change any int, nor array");
	writeln("Greetings   : ", typeof("Greetings").stringof);

	// c[0] = 86;	// Won't compile, items in array are immutable
	c ~= 999;		// May mutate array by appending elements
	c.length = 10;	// May mutate array by changing length
}

int readInt(string message)
{
	int result;

	write(message, "? ");
	readf(" %s", &result);

	return result;
}
