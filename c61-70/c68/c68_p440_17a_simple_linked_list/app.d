import std.stdio;

void main()
{

}

struct Node
{
	int element;
	Node* next;
}

struct List
{
	Node* head;

	void insertAtHead(int element)
	{
		head = new Node(element, head);
	}
}
