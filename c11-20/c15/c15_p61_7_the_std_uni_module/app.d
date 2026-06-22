import std.stdio : writeln;
import std.uni   : isLower, isUpper, isAlpha, isWhite, toLower, toUpper;

void main()
{
	writeln("Is ğ lowercase? ", isLower('ğ'));
	writeln("Is Ş lowercase? ", isLower('Ş'));
	writeln();

	writeln("Is İ uppercase? ", isUpper('İ'));
	writeln("Is ç uppercase? ", isUpper('ç'));
	writeln();

	writeln("Is z alphabetic? ", isAlpha('z'));
	writeln("Is \&euro; alphabetic? ", isAlpha('\&euro;'));
	writeln();

	writeln("Is new-line whitespace? ", isWhite('\n'));
	writeln("Is the underscore whitespace? ", isWhite('_'));
	writeln();

	writeln("The lowercase of Ğ: ", toLower('Ğ'));
	writeln("The lowercase of İ: ", toLower('İ'));
	writeln();

	writeln("The uppercase of ş: ", toUpper('ş'));
	writeln("The uppercase of ı: ", toUpper('ı'));
	writeln();
}
