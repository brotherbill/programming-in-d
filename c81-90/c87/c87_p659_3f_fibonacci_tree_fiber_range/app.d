import std.stdio       : writefln;
import std.range       : iota;
import std.string      : format;
import std.concurrency : yield, Generator;
import std.algorithm   : map, each;

// This alias is used for resolving the name conflict with std.range.Generator.
alias FiberRange = Generator;

void main()
{
	auto tree = makeRandomTree(10);
	writefln("%(%s %)", tree[]);
}

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

	// Note: print() member function is removed because it is not needed anymore.
	auto opSlice() const
	{
		return byNode(&this);
	}
}

// This is the fiber function that yields the next tree node in sorted order.
void nextNode(const(Node)* node)
{
	if (!node)
	{
		/* No element at or under this node */
		return;
	}

	nextNode(node.left); // First, elements on the left
	yield(node); // Then, this element
	nextNode(node.right); // Finally, elements on the right
}

// Returns an InputRange to the nodes of the tree.
auto byNode(const(Node)* node)
{
	return new FiberRange!(const(Node)*)(
		() => nextNode(node));
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

struct Tree
{
	Node* root;

	// Inserts the element to this tree.
	void insert(int element)
	{
		insertOrSet(root, element);
	}

	// Note: print() member function is removed because it is not needed anymore. 
	auto opSlice() const
	{
		// A translation from the nodes to the elements. 
		return byNode(this).map!(n => n.element);
	}
}

// Returns an InputRange to the nodes of the tree. 
// The returned range is empty if the tree has no elements (i.e. if 'root' is 'null'). 
auto byNode(const(Tree) tree)
{
	if (tree.root)
	{
		return byNode(tree.root);
	}
	else
	{
		alias RangeType = typeof(return);
		return new RangeType(() {}); // ← Empty range
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
