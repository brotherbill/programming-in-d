void main() {
	test_no_copy_constructor;
	test_no_assignment_constructor;
}

void test_no_copy_constructor() 
{
	auto a = Archive("records");
	auto b = a;
}

void test_no_assignment_constructor() 
{
	auto a = Archive("records");
	auto b = Archive("backup");
	b = a;
}

struct Archive {
	string fileName;

	// Disables the copy constructor
	@disable this(ref const(typeof(this)));
	// this(ref const(typeof(this))) {
	// 	assert(false, "Copy constructor is disabled");
	// }

	// Disables the postblit
	@disable this(this);

	// Disables the assignment operator
	@disable typeof(this) opAssign(ref const(typeof(this)));
	// typeof(this) opAssign(ref const(typeof(this))) {
	// 	assert(false, "Assignment operator is disabled");
	// 	return this;
	// }
}
