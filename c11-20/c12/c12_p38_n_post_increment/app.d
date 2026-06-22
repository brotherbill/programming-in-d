import std.stdio;

void main()
{
	int pre = 1;

	writeln("int pre = 1; has value: ", pre);
	int plusPlusPre = ++pre;
	writeln("After plusPlusPre = ++pre;  pre = ", pre, " and plusPlusPre = ", plusPlusPre);
	writeln();

	int post = 1;

	writeln("int post = 1; has value: ", post);
	int postPlusPlus = post++;
	writeln("After postPlusPlus = post++;  post = ", post, " and postPlusPlus = ", postPlusPlus);
	writeln();

	// Better approach to incrementing
	post = 1;
	postPlusPlus = post;
	post += 1; // ++post or post++ would also work, as they don't assign old value to another variable
	writeln("After postPlusPlus = post; post +=1;  post = ", post, " and postPlusPlus = ", postPlusPlus);
}
