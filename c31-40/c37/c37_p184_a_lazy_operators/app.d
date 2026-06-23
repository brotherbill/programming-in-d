import std.stdio : writeln;

void main()
{
	or_tester;
	writeln;

	and_tester;
	writeln;

	ternary_tester;
	writeln;

	if (startsWithA("Apple"))
	{
		writeln("Apple starts with A");
	}
	if (startsWithA(""))
	{
		writeln("Empty string starts with A");
	}
}

bool aTrueExpression()
{
	writeln("aTrueExpression");
	return true;
}

bool aFalseExpression()
{
	writeln("aFalseExpression");
	return false;
}

bool mayNotBeEvaluatedTrue()
{
	writeln("mayNotBeEvaluatedTrue");
	return true;
}

bool mayNotBeEvaluatedFalse()
{
	writeln("mayNotBeEvaluatedFalse");
	return false;
}

void or_tester()
{
	writeln("--- or_tester ---");
	if (aTrueExpression || mayNotBeEvaluatedFalse)
	{
		writeln("or_tester has true predicate");
	}
}

void and_tester()
{
	writeln("--- and_tester ---");
	if (aFalseExpression && mayNotBeEvaluatedFalse)
	{
		writeln("and_tester has true predicate");
	}
}

int eitherThis()
{
	writeln("eitherThis ran");
	return 100;
}

int orThis()
{
	writeln("orThis ran");
	return 20;
}

bool condition()
{
	writeln("condition ran");
	return true;
}

void ternary_tester()
{
	writeln("--- ternary_tester ---");
	int i = condition() ? eitherThis() : orThis();
	writeln("ternary_tester i: ", i);
}

bool startsWithA(dstring s)
{
	writeln("--- startsWithA ---");
	writeln("s: '", s, "'");


	// Don't code this way
	// s may be empty, so next line may crash
	// if (s[0] == 'A')
	// {
	// 	writeln("s starts with 'A'");
	// }
	
	// Better way to code it.  Use lazy AND operator.
	bool isNotEmptyAndStartsWithA = (s.length > 0) && (s[0] == 'A');
	if (isNotEmptyAndStartsWithA)
	{
		writeln("s is not empty and starts with A");
	}
	else
	{
		writeln("s does not start with A");
	}		

	return isNotEmptyAndStartsWithA;
}
