import std.stdio : writeln, writefln, write, readf;
import std.random : uniform;

void main()
{
	int total = 42;
	++total;
	const half = total / 2; // total is run time

	// hardcoding random number between 1 and 10 inclusive
	enum min = 1;
	enum max = 10;
	const target = uniform(min, max + 1); // target is run time
	writefln("I am thinking of a number between %s and %s.", min, max);

	auto isCorrect = false;
	while (!isCorrect)
	{
		const guess = readInt("What is your guess");
		isCorrect = (guess == target);
	}

	writeln("Correct!");
	writeln;

	const         a = [42, 100];
	const int[]   b = [42, 100];
	const (int)[] c = [42, 100];
	// const int([]) d = [42, 100];	// Invalid syntax.  Use const (int)[]
	const (int[]) e = [42,100];
	// a = [ 100, 42 ]; // Compile ERROR.  May not reassign array
	// a[0] = 99;  	  	// Compile ERROR.  May not change items in array
	// a ~= 86;		  	// Compile ERROR.  May not mutate array by appending elements
	// a.length = 10;  	// Compile ERROR.  May not mutate array by changing length

	const inferredType     = 0;
	const int explicitType = 1;
	const(int) fullType    = 2;

	writeln("inferredType: ", typeof(inferredType).stringof);
	writeln("explicitType: ", typeof(explicitType).stringof);
	writeln("fullType    : ", typeof(fullType).stringof);
	writeln("a (inferred): ", typeof(a).stringof, ", can't change any int, nor array");
	writeln("b int[]     : ", typeof(b).stringof, ", can't change any int, nor array");
	writeln("c (int)[]   : ", typeof(c).stringof, ", can't change any int, may change array by appending or changing length");
	writeln("e (int[])   : ", typeof(e).stringof, ", can't change any int, nor array");
	writeln("Greetings   : ", typeof("Greetings").stringof);

	// c[0] = 86;	// Won't compile, items in array are const
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
