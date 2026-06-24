import std.stdio;
import std.algorithm;

void main()
{
    int[] values = [1, 20, 7, 11];
    auto filtered = values.filter!(value => value > 10);
   
    writeln(filtered);
    writeln(typeof(filtered).stringof);

	int[] chosen = values.filter!(value => value > 10); // ← compilation ERROR
}
