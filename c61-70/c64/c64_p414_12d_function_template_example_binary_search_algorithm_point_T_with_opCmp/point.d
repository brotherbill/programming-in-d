module point;

import std.string;

struct Point(T) {
    T x;
    T y;

    string toString() const {
        return format("(%s,%s)", x, y);
    }

    // necessary for binary search to compare points
    int opCmp(const ref Point that) const {
        return (x == that.x ? y - that.y : x - that.x);
    }
}
