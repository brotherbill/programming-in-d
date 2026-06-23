import std.stdio : writeln;

void main()
{
	try
	{
		// operations about student records that may throw ...
		registerStudent;
	}
	catch (StudentIdDigitException exc)
	{
		// an exception that is specifically about errors with the digits of student ids
		writeln("StudentIdDigitException!!!");
	}
	catch (StudentIdException exc)
	{
		// a more general exception about student ids but not necessarily about their digits
		writeln("StudentIdException!!!");
	}
	catch (StudentRecordException exc)
	{
		// even more general exception about student records
		writeln("StudentRecordException");
	}
	catch (Exception exc)
	{
		// the most general exception that may not be related to student records
		writeln("Exception!!!");
	}
}

void registerStudent()
{
	throw new StudentIdException("exception message", "file_name", 42);
}

// We haven't yet covered classes or inheritance yet in the lessons
class StudentIdDigitException : Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__)
	{
		super(msg, file, line);
		writeln("Student Id has Digit issue");
	}
}

class StudentIdException : Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__)
	{
		super(msg, file, line);
		writeln("Student Id has an issue");
	}
}

class StudentRecordException : Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__)
	{
		super(msg, file, line);
		writeln("Student record has an issue");
	}
}
