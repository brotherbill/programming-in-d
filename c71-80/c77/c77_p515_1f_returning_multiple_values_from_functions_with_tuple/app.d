import std.stdio;
import std.algorithm;

void main()
{
	auto haystack = "Greetings!";
	auto needle = "et"; // The extra-terrestrial (movie)
	auto result = findSplit(haystack, needle);

	writeln("before: ", result[0]);
	writeln("found : ", result[1]);
	writeln("after : ", result[2]);
}
