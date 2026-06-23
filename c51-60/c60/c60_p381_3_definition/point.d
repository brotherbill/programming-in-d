module point;

import std.stdio;

struct Point {
    private int x;
    int y;

    private {
        // all of the definitions here are private
        string name;
        string address;
    }

private:
    // all of the definitions here are private
    int a;
    int b;

public:
    // all of the definitions here are public
    string c;
    string d;

export:
    // all of the definitions here are exportable
    double e;
    double f;

}

private void pointBar() {
    writeln("point.pointBar() called");
}
