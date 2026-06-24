import std.stdio;
import std.range;
import negative_module;
import fibonacci_series;

void main()
{
	writeln(FibonacciSeries().take(5).negative);
}
