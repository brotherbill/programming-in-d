import std.stdio : writeln;
import std.conv : to;

enum gregorianStartYear = 1582;

void main()
{
	writeln("days in February 2000: ", daysInFebruary(2000));
	writeln("days in February 1900: ", daysInFebruary(1900));
	writeln("days in February 2004: ", daysInFebruary(2004));
	writeln("days in February 2001: ", daysInFebruary(2001));
}

int daysInFebruary(in int year) pure
in
{
	assert(gregorianStartYear <= year, "year must be in Gregorian era, starting with " ~ gregorianStartYear.to!string);
}
out (result)
{
	assert((result == 28) || (result == 29));	
}
out (result)
{ 
	assert(ifAndOnlyIf(isLeapYear(year), result == 29));	// standard function notation
	assert(!(year.isLeapYear).ifAndOnlyIf(result == 28));	// fluent function notation.  Isn't this more readable?
}
do
{
	return year.isLeapYear ? 29 : 28;
}

// Based on Gregorian calendar rules starting from 1582
bool isLeapYear(in int year) pure
in
{
	assert(gregorianStartYear <= year, "year must be in Gregorian era, starting with " ~ gregorianStartYear.to!string);
}
out (result)
{
	assert( result.ifAndOnlyIf((year % 400 == 0) || (year %   4 == 0 && year % 100 != 0)));
	assert(!result.ifAndOnlyIf((year %   4 != 0) || (year % 100 == 0 && year % 400 != 0)));
}
do
{
	// Optimized implementation:
	/+
	if (year % 4   != 0) return false;  // Not a leap year, ex 2001
	if (year % 100 != 0) return true;   // Leap year      , ex 2004
	if (year % 400 == 0) return false;  // Not a Leap year, ex 2000
	return true;                        // Leap year      , ex 1900
	+/

	// Classic implementation:
	// /+
	if (year % 400 == 0) return true;
	if (year % 100 == 0) return false;
	if (year %   4 == 0) return true;
	return false;
	// +/
}

bool ifAndOnlyIf(in bool a, in bool b) pure
out (result)
{
	assert(result == ((a && b) || (!a && !b)));	
}		
do
{
	return (a && b) || (!a && !b);
}

unittest
{
	assert(daysInFebruary(2000) == 29, "Year 2000 should be a leap year as it is divisible by 400.");
	assert(daysInFebruary(1900) == 28, "Year 1900 should not be a leap year as it is divisible by 100 but not by 400.");
	assert(daysInFebruary(2004) == 29, "Year 2004 should be a leap year as it is divisible by 4 but not by 100.");
	assert(daysInFebruary(2001) == 28, "Year 2001 should not be a leap year as it is not divisible by 4.");
}
