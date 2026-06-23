module stack;

class Stack(T) {
private:

    T[] elements;

public:

    void push(T element) {
        elements ~= element;
    }

    void pop() {
        --elements.length;
    }

    T top() const {
        return elements[$ - 1];
    }

    size_t length() const {
        return elements.length;
    }
}

unittest {
    auto stack = new Stack!int;

    // The newly added element must appear on top
    stack.push(42);
    assert(stack.top == 42);
    assert(stack.length == 1);

    // .top and .length should not affect the elements
    assert(stack.top == 42);
    assert(stack.length == 1);

    // The newly added element must appear on top
    stack.push(100);
    assert(stack.top == 100);
    assert(stack.length == 2);

    // Removing the last element must expose the previous one
    stack.pop();
    assert(stack.top == 42);
    assert(stack.length == 1);

    // The stack must become empty when the last element is removed
    stack.pop();
    assert(stack.length == 0);
}
