import std.stdio;
import std.conv;
import std.string;

void main()
{
	List numbers;

	writeln("before: ", numbers);

	foreach (number; 0 .. 10)
	{
		numbers.insertAtHead(number);
	}

	writeln("after : ", numbers);
}

struct Node
{
	int element;
	Node* next;

	string toString() const
	{
		string result = to!string(element);

		if (next)
		{
			result ~= " -> " ~ to!string(*next);
		}
		return result;
	}
}

struct List
{
	Node* head;

	void insertAtHead(int element)
	{
		head = new Node(element, head);
	}

	string toString() const
	{
		return format("(%s)", head ? to!string(*head) : "");
	}
}
