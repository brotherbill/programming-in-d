import std.stdio;
import std.algorithm;

void main()
{
	string[string] dictionary = [
		"blue": "mavi", 
		"red": "kırmızı",
		"gray": "gri"
	];

	//       title              aa          keySeparator  elementSeparator
	printAA("Color Dictionary", dictionary, ":",          ", ");
}

// ...
void printAA(string title, string[string] aa, string keySeparator, string elementSeparator)
{
	writeln("-- ", title, " --");
	auto keys = sort(aa.keys);		// keys from aa, in sorted order

	// Don't print element separator before the first element
	if (keys.length != 0)
	{
		auto key = keys[0];
		write(key, keySeparator, aa[key]);
		keys = keys[1 .. $]; // Remove the first element
	}

	// Print element separator before the remaining elements
	foreach (key; keys)
	{
		write(elementSeparator);
		write(key, keySeparator, aa[key]);
	}

	writeln();
}
