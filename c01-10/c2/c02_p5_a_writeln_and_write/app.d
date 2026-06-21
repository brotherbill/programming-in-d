void main()
{
	// Import only the writeln function from the std.stdio module.
	// It will have block scope visibility.
	import std.stdio : writeln;

	// Each argument is printed in sequence, without space separators.
	// Each call to writeln ends with a newline.
	writeln("Hello, World!", "Hello, fish!");
}
