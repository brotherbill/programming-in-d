import std.stdio;

void main()
{
	bool existsCoffee = true;
	bool existsTea    = true;
	bool existsCookie = false;
	bool existsScone  = false;

	writeln("true  ||  false  && false : ",  true ||  false  && false);
	writeln("true  || (false  && false): ",  true || (false  && false));
	writeln("(true ||  false) && false : ", (true ||  false) && false);

	writeln("I am happy: ", (existsCoffee ||  existsTea) && (existsCookie  || existsScone));
	writeln("I am happy: ",  existsCoffee ||  existsTea  &&  existsCookie  || existsScone);
	writeln("I am happy: ",  existsCoffee || (existsTea  &&  existsCookie) || existsScone);
}
