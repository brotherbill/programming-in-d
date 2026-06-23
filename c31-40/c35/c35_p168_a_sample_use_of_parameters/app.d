import std.stdio : writefln;

void main()
{
	int quizGrade  = 76;
	int finalGrade = 80;

	writefln("Weighted average: %2.0f", weightedAverage(quizGrade, finalGrade));

	// quizGrade and finalGrade are unchanged by calling weightedAverage
	writefln("After: quizGrade is %d and finalGrade is %d.", quizGrade, finalGrade);
}

double weightedAverage(double quizGrade, double finalGrade) pure
{
	double result = quizGrade * 0.4 + finalGrade * 0.6;
	
	// Let's see if we can modify the arguments
	quizGrade  = 100;
	finalGrade = 100;

	return result;
}
