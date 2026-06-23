import std.stdio : writeln;
import std.conv : to;

void main()
{
	RaceTimes collection = {items: [0, 10, 20, 30, 40]};

	writeln("collection[3] = ", collection[3]);
	writeln;

	collection[3] = 33;
	writeln("after collectior[3] = 33;  collection[3] = ", collection[3]);

	int temp = ++collection[3]; // increase temp and collection[3] to 34
	writeln("after ++collection[3], temp=", temp, ", collection[3] == ", collection[3]);

	temp = collection[3]++; // increase collection[3] to 35, leaving temp at 34
	writeln("after collection[3]++, temp=", temp, ", collection[3] == ", collection[3]);

	collection[3] = 30;
	temp = --collection[3]; // decrease temp and collection[3] to 29
	writeln("after ++collection[3], temp=", temp, ", collection[3] == ", collection[3]);

	temp = collection[3]--; // decrease collection[3] to 28, leaving temp at 29
	writeln("after collection[3]--, temp=", temp, ", collection[3] == ", collection[3]);

	collection[3] = 30;
	collection[3] += 9;
	writeln("after collection[3] += 9, collection[3] == ", collection[3]);

	writeln("items[$ - 1] is: ", collection[$ - 1]);
	writeln("items[]: ", collection[]);
	writeln("items[1..4]: ", collection[1 .. 4]);
}

struct RaceTimes
{
	int[] items;

	// element access, sample usage: collection[i];
	ref int opIndex(size_t i)
	{
		return items[i];
	}

	// assignment to element, sample usage: collection[i] = 7;
	void opIndexAssign(int value, size_t key)
	{
		items[key] = value;
	}

	// unary operation on element, sample usage: ++collection[i] or collection[i]++
	int opIndexUnary(string op)(size_t index) if (op == "++" || op == "--")
	{
		final switch (op)
		{
		case "++":
			return ++items[index];
		case "--":
			return --items[index];
		}
	}

	// operation with assignment on element
	// for example, just doing +=, -=, *=, /=
	// remaining ones are left as an exercise
	void opIndexOpAssign(string op)(int value, size_t index)
	{
		final switch (op)
		{
		case "+":
			items[index] += value;
			break;
		case "-":
			items[index] -= value;
			break;
		case "*":
			items[index] *= value;
			break;
		case "/":
			items[index] /= value;
			break;
		}
	}

	// number of elements, sample usage: collection[$ - 1]
	size_t opDollar() const
	{
		return items.length;
	}

	// slice of all elements, sample usage: collection[]
	inout(int[]) opSlice() inout
	{
		return items;
	}

	// slice of some elements, sample usage: collection [i..j]  (j is exclusive)
	inout(int[]) opSlice(size_t lowIndex, size_t highIndex) inout
	{
		return items[lowIndex .. highIndex];
	}
}
