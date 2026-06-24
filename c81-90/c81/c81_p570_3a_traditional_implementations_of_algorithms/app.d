import std.stdio;

void main()
{
	Node head = { element: 10, next: null };
	print(&head);

	Node tail = { element: 20, next: null };
	head.next = &tail;
	print(&head);
}

struct Node
{
	int element;
	Node* next;
}

void print(const(Node)* list)
{
	for (; list; list = list.next)
	{
		write(' ', list.element);
	}
	writeln;
}
