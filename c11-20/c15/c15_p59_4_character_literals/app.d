import std.stdio : writeln;

void main()
{
	char  letter_a       = 'a';
	wchar letter_e_acute = 'é';
	writeln("Character a      : ", letter_a);
	writeln("Character e acute: ", letter_e_acute);
	writeln();

	wchar currencySymbol = '\&euro;';
	writeln("Currency symbol: ", currencySymbol);
	writeln();

	char  a =  97;
	wchar Ğ = 286;
	writeln("Character a from ASCII: ", a);
	writeln("Character G with breve: ", Ğ);
	writeln();

	char questionMarkOctal       = '\77';
	char questionMarkHexadecimal = '\x3f';
	writeln("Question mark from octal      : ", questionMarkOctal);
	writeln("Question mark from hexadecimal: ", questionMarkHexadecimal);
	writeln();

	wchar Ğ_w =     '\u011e';
	dchar Ğ_d = '\U0000011e';
	writeln("Character G with breve from wide char: ", Ğ_w);
	writeln("Character G with breve from dchar    : ", Ğ_d);
	writeln();

	writeln("Résumé preparation: 10.25€");
	writeln("\x52\&eacute;sum\u00e9 preparation: 10.25\&euro;");
	//       R    é       sumé      preparation: 10.25€
}
