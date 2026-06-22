import std.stdio : writeln;

void main()
{
	writeln("IN THE DECIMAL SYSTEM");

	auto double42 = 42.;
	writeln("double42: ", typeof(double42).stringof, " ", double42);

	double doubleTenth = .1;
	writeln("doubleTenth: ", typeof(doubleTenth).stringof, " ", doubleTenth);

	float floatPi = 3.141592653;
	writeln("floatPi: ", typeof(floatPi).stringof, " ", floatPi);

	double avogadro = 6.02214e23;
	writeln("avogadro: ", typeof(avogadro).stringof, " ", avogadro);

	double tinyDecimal = 3e-2;
	writeln("tinyDecimal: ", typeof(tinyDecimal).stringof, " ", tinyDecimal, ", 3 / 10 ^^ 2 = 3 / 100 = 0.03");

	real coke = 0.05;
	writeln("coke: ", typeof(coke).stringof, " ", coke);
	writeln;

	writeln("IN THE HEXADECIMAL SYSTEM");
	writeln("Can't use e or E as exponent in hexadecimal, so we use p instead for base 2 exponent");
	writeln("Exponent is in decimal notation as power of 2");
	writeln("D may be only language expressing floating point numbers in hexadecimal with base 2 exponent");
	writeln("This is done to avoid rounding errors");
	writeln;

	double priceOfDeadBeef = 0xDEAD.BEEF_p0;
	writeln("priceOfDeadBeef : ", typeof(priceOfDeadBeef).stringof, " ", priceOfDeadBeef);

	double priceOfSteak = 0xDEAD.BEEF_p3;
	writeln("priceOfSteak    : ", typeof(priceOfSteak).stringof, " ", priceOfSteak);
	assert(priceOfSteak == priceOfDeadBeef * 2 ^^ 3);

	double priceOfCoffeeBeans = 0xC0FFEE.0_p0;
	writeln("priceOfCoffeeBeans: ", typeof(priceOfCoffeeBeans).stringof, " ", priceOfCoffeeBeans);
	double priceOfCoffee = 0xC0FFEE.0_p-3;
	writeln("priceOfCoffee:      ", typeof(priceOfCoffee).stringof, " ", priceOfCoffee);
	assert(priceOfCoffee == priceOfCoffeeBeans / 2 ^^ 3);
	writeln("");

	writeln("f / F and L specifiers");
	writeln("f / F means float.  L means real.  May not use lowercase l to avoid confusion with 1.");

	auto pi = 3.14F;
	writeln("pi: ", typeof(pi).stringof, " ", pi);

	auto cocaCola = 0.05L; // Coca Cola was 5 cents for 6.5 ounce glass returnable bottle for 70 years.
	writeln("cocaCola: ", typeof(cocaCola).stringof, " ", cocaCola);
}
