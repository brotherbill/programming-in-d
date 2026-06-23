import std.stdio;

void main()
{
    do_something;
}

// deprecated("Please use doSomething() instead.") // No trailing semicolon, please
alias do_something = doSomething;   // This allows legacy code to still work, but without warning.

// void do_something() {
//     writeln("Using Eiffel snake_case, which doesn't pass D language style guide");
// }

void doSomething()
{
    writeln(
        "Using clean, mother approved camelCase styling which passes the D language style guide");
}
