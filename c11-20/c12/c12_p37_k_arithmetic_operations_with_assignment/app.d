import std.stdio;

void main()
{
	int number = 10;
	writeln("number   = ", number);

	number += 20; // same as number = number + 20; now 30
	writeln("number  += 20 is ", number);

	number -= 5; // same as number = number - 5;  now 25
	writeln("number  -=  5 is ", number);

	number *= 2; // same as number = number * 2;  now 50
	writeln("number  *=  2 is ", number);

	number /= 3; // same as number = number / 3;  now 16
	writeln("number  /=  3 is ", number);

	number %= 7; // same as number = number % 7;  now  2
	writeln("number  %=  7 is ", number);

	number ^^= 6; // same as number = number ^^ 6; now 64
	writeln("number ^^=  6 is ", number);
}
