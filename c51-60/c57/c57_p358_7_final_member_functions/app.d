import std.stdio  : write, writefln, readln, readf;
import std.string : strip;
import std.random : uniform;
import std.conv   : to;

void main()
{
	useGame(new DiceSummingGame());
}

void useGame(Game game)
{
	game.play();
}

interface Game
{
	final void play()
	{
		string name = gameName();

		writefln("Starting %s", name); 

		introducePlayers();
		prepare();
		begin();
		end();

		writefln("Ending %s", name);
	}

	string gameName();
	void introducePlayers();
	void prepare();
	void begin();
	void end();
}

class DiceSummingGame : Game
{
	string player;
	size_t count;
	size_t sum;

	string gameName()
	{
		return "Dice Summing Game";
	}

	void introducePlayers()
	{
		write("What is your name? ");
		player = strip(readln());
	}

	void prepare()
	{
		write("How many times to throw the dice? ");
		readf(" %s", &count);
		sum = 0;
	}

	void begin()
	{
		foreach (i; 0 .. count)
		{
			immutable dice = uniform(1, 7);  // 1 to 6
			writefln("%s: %s", i, dice);
			sum += dice;
		}
	}

	void end()
	{
		writefln("Player: %s, Dice sum: %s, Average: %s",
			player, sum, to!double(sum) / count);
	}
}
