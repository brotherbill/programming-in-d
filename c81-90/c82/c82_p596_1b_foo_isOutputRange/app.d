import std.stdio;
import std.traits;
import std.algorithm;
import std.range;

void main()
{
	auto output = MultiFile("\n", "output_0", "output_1");
	copy([1.1, 2.2, 3.3], output);
	output.foo([1.1, 2.2, 3.3]);
}

struct MultiFile
{
	string delimiter;
	File[] files;

	this(string delimiter, string[] fileNames...)
	{
		this.delimiter = delimiter;

		// stdout is always included
		this.files ~= stdout;

		// A File object for each file name
		foreach (fileName; fileNames)
		{
			this.files ~= File(fileName, "w");
		}
	}

	// This is the version that takes arrays (but not strings)
	// Not called in this project
	void put(T)(T slice) if (isArray!T && !isSomeString!T)
	{
		foreach (element; slice)
		{
			// Note that this is a call to the other version of put() below
			put(element);
		}
	}

	// This is the version that takes non-arrays and strings
	void put(T)(T value) if ((!isArray!T || isSomeString!T))	//  && isOutputRange!(T, double)
	{
		foreach (file; files)
		{
			file.write(value, delimiter);
		}
	}

	void foo(T)(T range) if (isOutputRange!(T, double))
	{
		writeln("foo(T)");
		foreach (file; files)
		{
			file.write("foo: ", range);
		}
		writeln;
	}
}
