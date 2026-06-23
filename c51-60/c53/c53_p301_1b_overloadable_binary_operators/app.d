import std.stdio : writeln;
import std.conv : to;

void main()
{
	Counter counter = {count: 20};
	long three = 3;

	Counter result = counter + three;
	writeln("20 + 3 = ", result.count);
	writeln;

	result = three + counter;
	writeln("3 + 20 = ", result.count);
	writeln;

	result = counter - three;
	writeln("20 - 3 = ", result.count);
	result = three - counter;
	writeln("3 - 20 = ", result.count);
	writeln;

	result = counter * three;
	writeln("20 * 3 = ", result.count);
	result = three * counter;
	writeln("3 * 20 = ", result.count);
	writeln;

	result = counter / three;
	writeln("20 / 3 = ", result.count);
	result = three / counter;
	writeln("3 / 20 = ", result.count);
	writeln;

	result = counter % three;
	writeln("20 % 3 = ", result.count);
	result = three % counter;
	writeln("3 % 20 = ", result.count);
	writeln;

	result = counter ^^ three;
	writeln("20 ^^ 3 = ", result.count);
	result = three ^^ counter;
	writeln("3 ^^ 20 = ", result.count);
	writeln;

	result = counter & three;
	writeln("20 & 3 = ", result.count);
	result = three & counter;
	writeln("3 & 20 = ", result.count);
	writeln;

	result = counter | three;
	writeln("20 | 3 = ", result.count);
	result = three | counter;
	writeln("3 | 20 = ", result.count);
	writeln;

	result = counter ^ three;
	writeln("20 ^ 3 = ", result.count);
	result = three ^ counter;
	writeln("3 ^ 20 = ", result.count);
	writeln;

	result = counter << three;
	writeln("20 << 3 = ", result.count);
	result = three << counter;
	writeln("3 << 20 = ", result.count);
	writeln;

	result = counter >> three;
	writeln("20 >> 3 = ", result.count);
	result = three >> counter;
	writeln("3 >> 20 = ", result.count);
	writeln;

	result = counter >>> three;
	writeln("20 >>> 3 = ", result.count);
	result = three >>> counter;
	writeln("3 >>> 20 = ", result.count);
	writeln;

	result = counter ~ three;
	writeln("20 ~ 3 = ", result.count);
	result = three ~ counter;
	writeln("3 ~ 20 = ", result.count);
	writeln;

	// Won't compile, since we didn't implement in for Counter, long
	// result = counter in three;
	// writeln("20 in 3 = ", result.count);
	// result = three in counter;
	// writeln("3 in 20 = ", result.count);
	// writeln;

	bool boolResult = (counter == three);
	writeln("20 == 3 = ", boolResult);
	boolResult = three == counter;
	writeln("3 == 20 = ", boolResult);
	writeln;

	boolResult = (counter != three);
	writeln("20 != 3 = ", boolResult);
	boolResult = three != counter;
	writeln("3 != 20 = ", boolResult);
	writeln;

	boolResult = (counter < three);
	writeln("20 < 3 = ", boolResult);
	boolResult = three < counter;
	writeln("3 < 20 = ", boolResult);
	writeln;

	boolResult = (counter <= three);
	writeln("20 <= 3 = ", boolResult);
	boolResult = three <= counter;
	writeln("3 <= 20 = ", boolResult);
	writeln;

	boolResult = (counter > three);
	writeln("20 > 3 = ", boolResult);
	boolResult = three > counter;
	writeln("3 > 20 = ", boolResult);
	writeln;

	boolResult = (counter >= three);
	writeln("20 >= 3 = ", boolResult);
	boolResult = three >= counter;
	writeln("3 >= 20 = ", boolResult);
	writeln;

	result = 42;
	writeln("42 is Counter(", result.count, ")");
	writeln;

	result += 100L;
	writeln("42 += 100 = ", result.count); // 142

	result -= 100;
	writeln("142 -= 100 = ", result.count); // 42

	result *= 10;
	writeln("42 *= 100 = ", result.count); // 420

	result /= 42;
	writeln("420 /= 42 = ", result.count); // 10

	result %= 4;
	writeln("10 %= 4 = ", result.count); // 2

	result^^=3;
	writeln("2 ^^= 3 = ", result.count); // 8

	result = 7;
	result &= 13;
	writeln("7 &= 13 = ", result.count); // 5

	result = 7;
	result |= 13;
	writeln("7 &= 13 = ", result.count); // 15

	result = 7;
	result ^= 13;
	writeln("7 ^= 13 = ", result.count); // 10

	result = 7;
	result <<= 3;
	writeln("7 <<= 3 = ", result.count); // 56

	result = 7;
	result >>= 1;
	writeln("7 >>= 1 = ", result.count); // 3

	result = 7;
	result >>>= 1;
	writeln("7 >>>= 1 = ", result.count); // 3

	result = 20;
	result ~= 73;
	writeln("20 ~= 73 = ", result.count); // 2073
}

struct Counter
{
	long count;

	// add Counter + 3
	Counter opBinary(string op : "+")(long other) const
	{
		writeln("opBinary");
		return Counter(count + other);
	}

	// add 3 + Counter
	Counter opBinaryRight(string op : "+")(long other) const
	{
		writeln("opBinaryRight");
		return Counter(count + other);
	}

	// subtract Counter - 3
	Counter opBinary(string op : "-")(long other) const
	{
		return Counter(count - other);
	}

	// subtract 3 - Counter
	Counter opBinaryRight(string op : "-")(long other) const
	{
		return Counter(other - count);
	}

	// multiply Counter * 3
	Counter opBinary(string op : "*")(long other) const
	{
		return Counter(count * other);
	}

	// multiply 3 * Counter
	Counter opBinaryRight(string op : "*")(long other) const
	{
		return Counter(other * count);
	}

	// divide Counter / 3
	Counter opBinary(string op : "/")(long other) const
	{
		return Counter(count / other);
	}

	// divide 3 / Counter
	Counter opBinaryRight(string op : "/")(long other) const
	{
		return Counter(other / count);
	}

	// remainder of Counter % 3
	Counter opBinary(string op : "%")(long other) const
	{
		return Counter(count % other);
	}

	// remainder of 3 % Counter
	Counter opBinaryRight(string op : "%")(long other) const
	{
		return Counter(other % count);
	}

	// Counter to the power of 3
	Counter opBinary(string op : "^^")(long other) const
	{
		return Counter(count ^^ other);
	}

	// 3 to the power of Counter
	Counter opBinaryRight(string op : "^^")(long other) const
	{
		return Counter(other ^^ count);
	}

	// Counter bitwise and 3
	Counter opBinary(string op : "&")(long other) const
	{
		return Counter(count & other);
	}

	// 3 bitwise and Counter
	Counter opBinaryRight(string op : "&")(long other) const
	{
		return Counter(other & count);
	}

	// Counter bitwise or 3
	Counter opBinary(string op : "|")(long other) const
	{
		return Counter(count | other);
	}

	// 3 bitwise or Counter
	Counter opBinaryRight(string op : "|")(long other) const
	{
		return Counter(other | count);
	}

	// Counter bitwise xor 3
	Counter opBinary(string op : "^")(long other) const
	{
		return Counter(count ^ other);
	}

	// 3 bitwise xor Counter
	Counter opBinaryRight(string op : "^")(long other) const
	{
		return Counter(other ^ count);
	}

	// Counter left-shift 3
	Counter opBinary(string op : "<<")(long other) const
	{
		return Counter(count << other);
	}

	// 3 left-shift Counter
	Counter opBinaryRight(string op : "<<")(long other) const
	{
		return Counter(other << count);
	}

	// Counter right-shift 3
	Counter opBinary(string op : ">>")(long other) const
	{
		return Counter(count >> other);
	}

	// 3 right-shift Counter
	Counter opBinaryRight(string op : ">>")(long other) const
	{
		return Counter(other >> count);
	}

	// Counter unsigned right-shift 3
	Counter opBinary(string op : ">>>")(long other) const
	{
		return Counter(count >>> other);
	}

	// 3 unsigned right-shift Counter
	Counter opBinaryRight(string op : ">>>")(long other) const
	{
		return Counter(other >>> count);
	}

	// Counter concatenate 3  (will concatenate string representations)
	Counter opBinary(string op : "~")(long other) const
	{
		string sCount = to!string(count);
		string sOther = to!string(other);
		string sResult = sCount ~ sOther;
		long result = to!long(sResult);
		return Counter(result);
	}

	// 3 concatenate Counter  (will concatenate string representations)
	Counter opBinaryRight(string op : "~")(long other) const
	{
		string sCount = to!string(count);
		string sOther = to!string(other);
		string sResult = sOther ~ sCount;
		long result = to!long(sResult);
		return Counter(result);
	}

	// in  whether contained in  (intentionally not implemented)

	// Counter whether equal to 
	// whether not equal to (compiler adds this)
	bool opEquals()(auto ref const long other) const
	{
		return count == other;
	}

	// Counter < 3
	// whether before	  <
	// whether not after  <=
	// whether after	  >
	// whether not before >=
	int opCmp()(auto ref const long other) const
	{
		if (count < other)
			return -1;
		else if (count == 0)
			return 0;
		else
			return 1;
	}

	// Counter = 3
	// assign
	void opAssign(long rhs)
	{
		this.count = rhs;
	}

	// Counter += 3
	ref Counter opOpAssign(string op)(auto ref const long rhs)
	{
		final switch (op)
		{
		case "+": // increment by
			this.count += rhs;
			break;
		case "-": // decrement by
			this.count -= rhs;
			break;
		case "*": // multiply and assign
			this.count *= rhs;
			break;
		case "/": // divide and assign
			this.count /= rhs;
			break;
		case "%": // divide and assign
			this.count %= rhs;
			break;
		case "^^": // assign to the power of
			this.count^^=rhs;
			break;
		case "&": // assign the result of &
			this.count &= rhs;
			break;
		case "|": // assign the result of |
			this.count |= rhs;
			break;
		case "^": // assign the result of ^
			this.count ^= rhs;
			break;
		case "<<": // assign the result of <<
			this.count <<= rhs;
			break;
		case ">>": // assign the result of >>
			this.count >>= rhs;
			break;
		case ">>>": // assign the result of >>>
			this.count >>>= rhs;
			break;
		case "~": // assign the result of ~
			string sCount = to!string(count);
			string sRhs = to!string(rhs);
			string sResult = sCount ~ sRhs;
			long result = to!long(sResult);

			this.count = result;
			break;
		}

		return this;
	}
}
