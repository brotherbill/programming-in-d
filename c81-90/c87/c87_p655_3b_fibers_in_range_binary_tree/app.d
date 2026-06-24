import std.stdio  : write, writeln;
import std.string : format;
import std.conv   : to;

// import std.random;
import std.range;
import std.algorithm;

void main()
{
	auto tree = makeRandomTree(10);
	tree.print();
}

// Represents the nodes of a binary tree. 
// This type is used in the implementation of struct Tree below and should not be used directly. 
struct Node
{
	int element;
	Node* left; // Right sub-tree
	Node* right; // Left sub-tree

	void insert(int element)
	{
		if (element < this.element)
		{
			// Smaller elements go under the left sub-tree. 
			insertOrSet(left, element);
		}
		else if (element > this.element)
		{
			// Larger elements go under the right sub-tree. 
			insertOrSet(right, element);
		}
		else
		{
			throw new Exception(format("%s already exists", element));
		}
	}

	void print() const
	{
		// First print the elements of the left sub-tree
		if (left)
		{
			left.print();
			write(' ');
		}

		// Then print this element 
		write(element);

		// Lastly, print the elements of the right sub-tree 
		if (right)
		{
			write(' ');
			right.print();
		}
	}
}

// Inserts the element to the specified sub-tree, potentially initializing its node.
void insertOrSet(ref Node* node, int element)
{
	if (!node)
	{
		// This is the first element of this sub-tree.
		node = new Node(element);
	}
	else
	{
		node.insert(element);
	}
}

// This is the actual Tree representation. 
// It allows an empty tree by means of 'root' being equal to 'null'. 
struct Tree
{
	Node* root;

	// Inserts the element to this tree.
	void insert(int element)
	{
		insertOrSet(root, element);
	}

	// Prints the elements in sorted order.
	void print() const
	{
		if (root)
		{
			root.print();
		}
	}
}

// Populates the tree with 'n' random numbers picked out of a set of '10 * n' numbers.
Tree makeRandomTree(size_t n)
{
	// auto numbers = iota((n * 10).to!int);

	int[] numbers = [47, 33, 41, 40,  7, 91, 31, 17, 79, 22, 
				     93, 82, 62,  9, 70, 76, 97, 29, 67, 42,
					 16, 49, 87,  1, 68, 39, 34, 95, 63, 88, 
					 65,  0, 53, 92, 10, 24, 61, 57, 20, 55, 
					  5, 89, 26, 96, 12, 36, 37, 23, 13, 52,
					 45, 38, 28, 75, 66, 99, 35, 50, 11, 60, 
					 80, 69,  6, 94, 73, 27, 84, 77, 81, 43,
					 21, 72,  2, 15, 46,  3, 32, 85, 71, 56,
					 44, 19, 86, 48, 83, 51, 98, 14, 74, 78,
					 64, 18, 25,  4, 30, 90, 58,  8, 59, 54];
		//.randomSample(n, Random(unpredictableSeed))
		//.array;

	// randomShuffle(numbers);

	// Populate the tree with those numbers.
	auto tree = Tree();

	numbers.each!(e => tree.insert(e));

	return tree;
}
