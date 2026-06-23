import std.stdio : stdin, write, writeln, writefln;
import std.string : strip;
import std.algorithm.searching : endsWith;
import std.conv : to;

int lastIntegerRead; 	// last integer read from getInteger()

void main()
{
	getInteger;
	writefln("Last integer read: %,d", lastIntegerRead);
}

/// Prompts user to enter an integer, attempts to read it from standard input.
/// Retries up to 3 times if input is invalid.
/// Raises Exception if all attempts fail.
void getInteger() 
{
	while (true)
	{
		try
		{
			// Body of getInteger BEGIN
			write("Please enter an integer: ");
			readOneInteger();
			// Body of getInteger END
			return;
		}
		catch (Exception e)
		{
			// Rescue block of getInteger BEGIN
			// This is where we attempt to rescue from invalid input, up to 3 times.
			// This section doesn't do the work of reading the integer, just responds to the errors, and retries up to 3 times.

			enum   int maxAttempts = 3;	
			static int attempts    = 0;

			if (e.msg.endsWith(" is not an integer"))
			{
				attempts += 1; 
				if (attempts < maxAttempts)
				{
					writeln("Invalid input. Please try again.\n");
					continue;
				}
				else
				{
					throw new Exception("Maximum attempts reached. " ~ e.msg);
				}
			}
			else	// Some other exception, re-raise it
			{
				throw e;
			}

			// Rescue block of getInteger END
		}
	}
}

/// Without prompt, attempts to read one integer from standard input, after user enters number and presses enter.
/// Raises Exception if not an integer.
void readOneInteger()
{
	string s = stdin.readln().strip();
	lastIntegerRead = asInteger(s);
}

/// convert character '0' .. '9' to integer 0 .. 9
int asDigit(char c) 
{
	return c - '0';
}

/// aString as a 32 bit integer.  Raise exception if not an integer.
/// I'm sure there's a better way to do this in D, but this is an exercise.
int asInteger(string aString)
{
	bool ok = false;
	bool isNegative = false;
	long accumulator = 0;
	int i;
	char c;
	immutable int max_sign_digits_characters = 11; // -2147483648
	int result = 0;

	if ((aString.length == 0) || (aString.length > max_sign_digits_characters) || (aString == "+") || (aString == "-"))
	{
		throw new Exception(aString ~ " is not an integer");
	}

	for ({ ok = true; i = 0; } ok && aString.length > i; i++)
	{
		c = aString[i];

		if (i == 0)
		{
			switch (c) 
			{
				case '+': 
					break;
				case '-': 
					isNegative = true;
					break;
				case '0': .. case '9': 
					accumulator = asDigit(c);
					break;
				default:
					ok = false;
					break;
			}
		}
		else if ('0' <= c && c <= '9')
		{
			accumulator = accumulator * 10 + asDigit(c);
		}
		else
		{
			ok = false;
		}
	}

	ok = ok && (aString != "+") && (aString != "-");

	if (ok) 
	{
		if (isNegative)
		{
			ok = (accumulator <= 2_147_483_648);
		}
		else 
		{
			ok = (accumulator <= 2_147_483_647);
		}
	}

	if (ok) 
	{
		result = cast(int) accumulator;
		if (isNegative)
		{
			result = -result;
		}
	}
	else 
	{
		throw new Exception(aString ~ " is not an integer");
	}

	return result;
}
