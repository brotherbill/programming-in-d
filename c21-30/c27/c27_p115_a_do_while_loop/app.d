import std.random : uniform;
import std.stdio : readf, write, writeln;

void main()
{
	int target = uniform(1, 101);  // generates a random number between 1 and 100, inclusive

	writeln("I am thinking of a number between 1 and 100.");
	int guess;

	do
	{
		write("What is your guess? ");
		readf(" %s", &guess);
		
		if (target < guess)
		{
			writeln("That's too HIGH!");
		}
		else if (guess < target)
		{
			writeln("That's too LOW");
		}
	}
	while (guess != target);

	writeln("Congratulations, that's the number!");
}
