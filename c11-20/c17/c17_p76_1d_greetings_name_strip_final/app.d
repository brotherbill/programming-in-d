import std.stdio  : write, readln, writeln;
import std.string : strip;

void main()
{
    write("What is your name? ");
    string name = readln().strip();
    writeln("Greetings ", name, "!");
}
