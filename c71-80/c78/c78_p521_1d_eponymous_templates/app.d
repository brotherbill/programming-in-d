import std.stdio;

void main()
{
	writeln("isTooLarge!int: ", isTooLarge!int);
	writeln("isTooLarge!(char[20]): ", isTooLarge!(char[20]));
	writeln("isTooLarge!(char[21]): ", isTooLarge!(char[21]));
	writeln;

	writeln("isTooLargeShortcutSyntax!int: ", isTooLargeShortcutSyntax!int);
	writeln("isTooLargeShortcutSyntax!(char[20]): ", isTooLargeShortcutSyntax!(char[20]));
	writeln("isTooLargeShortcutSyntax!(char[21]): ", isTooLargeShortcutSyntax!(char[21]));

}

template isTooLarge(T)
{
	enum isTooLarge = T.sizeof > 20;
}

enum isTooLargeShortcutSyntax(T) = T.sizeof > 20;
