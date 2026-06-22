import std.stdio;

void main()
{
	// Each argument is an expression.  Three arguments means three expressions.
	writeln("It's ", currentTemperature(), " degrees at the moment.");


	// Look ma, no parentheses!  currentTemperature "feels" like a Property.
	writeln("It's ", currentTemperature, " degrees at the moment.");
}


int currentTemperature()
{
	// 23 is also an expression
	int temperature = 23;
	return temperature;
}
