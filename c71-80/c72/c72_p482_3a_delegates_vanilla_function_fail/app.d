import std.stdio;

void main()
{

}

alias Calculator = int function(int);

Calculator makeCalculator()
{
	int increment = 10;
	return value => increment + value; // ← compilation ERROR
}
