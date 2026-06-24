import std.stdio;

void main()
{
	bruteForce;
	with_s;
	with_s_expression;
}

struct S
{
	int i;
	int j;
	int k;
}

void bruteForce()
{
	auto s = S();

	// Note repetition of 's.'	
	s.i = 1;
	s.j = 2;
	s.k = 3;
	writeln("bruteForce(): ", s.i, ", ", s.j, ", ", s.k);
}

void with_s()
{
	auto s = S();

	// Using 'with' to avoid repetition of 's.'
	with (s)
	{
		i = 10;
		j = 20;
		k = 30;
	}
	writeln("with_s(): ", s.i, ", ", s.j, ", ", s.k);
}

void with_s_expression()
{
	with (S())
	{
		i = 100;
		j = 200;
		k = 300;

		writeln("with_s_expression(): ", i, ", ", j, ", ", k);
	}
}
