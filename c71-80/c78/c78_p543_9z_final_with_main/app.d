import std.stdio;
import std.format;
import std.string;

void main() {
	enum height = 10;
	enum width = 8;
	auto m = Matrix(height, width);
	int counter = 0;

	foreach (row; 0 .. height) {
		foreach (column; 0 .. width) {
			writefln("Initializing %s of %s",
				counter + 1, height * width);
			m[row, column] = counter;
			++counter;
		}
	}

	// writeln(m);
	// execute!("m[1, 1] = 42")(m);
	// execute!("m[0, 1 .. $] = 43")(m);
	// execute!("m[0 .. $, 3] = 44")(m);
	// execute!("m[$-4 .. $-1, $-4 .. $-1] = 7")(m);
	// execute!("m[1, 1] *= 2")(m);
	// execute!("m[0, 1 .. $] *= 4")(m);
	// execute!("m[0 .. $, 0] *= 10")(m);
	// execute!("m[$-4 .. $-2, $-4 .. $-2] -= 666")(m);
	// execute!("m[1, 1]")(m);
	// execute!("m[2, 0 .. $]")(m);
	// execute!("m[0 .. $, 2]")(m);
	// execute!("m[0 .. $ / 2, 0 .. $ / 2]")(m);
	// execute!("++m[1..3, 1..3]")(m);
	// execute!("--m[2..5, 2..5]")(m);
	// execute!("m[]")(m);
	// execute!("m[] = 20")(m);
	// execute!("m[] /= 4")(m);
	// execute!("(m[] += 5) /= 10")(m);
}

// Works as a two-dimensional int array
struct Matrix {
private:
	int[][] rows;

	// Represents a range of rows or columns
	struct Range {
		size_t begin;
		size_t end;
	}

	// Returns the sub-matrix that is specified by the row and column ranges
	Matrix subMatrix(Range rowRange, Range columnRange) {
		writeln(__FUNCTION__);
		int[][] slices;

		foreach (row; rows[rowRange.begin .. rowRange.end]) {
			slices ~= row[columnRange.begin .. columnRange.end];
		}

		return Matrix(slices);
	}

public:
	this(size_t height, size_t width) {
		writeln(__FUNCTION__);
		rows = new int[][](height, width);
	}

	this(int[][] rows) {
		writeln(__FUNCTION__);
		this.rows = rows;
	}

	void toString(void delegate(const(char)[]) sink) const {
		sink.formattedWrite!"%(%(%5s %)\n%)"(rows);
	}

	// Assigns the specified value to each element of the matrix
	Matrix opAssign(int value) {
		writeln(__FUNCTION__);
		foreach (row; rows) {
			row[] = value;
		}
		return this;
	}

	// Uses each element and a value in a binary operation and assigns the result back to that element
	Matrix opOpAssign(string op)(int value) {
		writeln(__FUNCTION__);
		foreach (row; rows) {
			mixin("row[] " ~ op ~ "= value;");
		}
		return this;
	}

	size_t opDollar(size_t dimension)() const
	if (dimension <= 1) {
		writeln(__FUNCTION__);
		static if (dimension == 0) {
			// The length of dimension 0 is the length of the 'rows' array
			return rows.length;
		} else {
			// The length of dimension 1 is the lengths of the elements of 'rows'
			return rows.length ? rows[0].length : 0;
		}
	}

	// Returns an object that represents the range from 'begin' to 'end'
	//
	//   Note: Although the 'dimension' template parameter is not used here, that information can be useful for other types
	Range opSlice(size_t dimension)(size_t begin, size_t end) if (dimension <= 1) {
		writeln(__FUNCTION__);
		return Range(begin, end);
	}

	// Returns a sub-matrix that is defined by the arguments
	Matrix opIndex(A...)(A arguments) if (A.length <= 2) {
		writeln(__FUNCTION__);
		// We start with ranges that represent the entire matrix so that the parameter-less use of opIndex means "all of the elements"
		Range[2] ranges = [Range(0, opDollar!0), Range(0, opDollar!1)];

		foreach (dimension, a; arguments) {
			static if (is(typeof(a) == Range)) {
				// This dimension is already specified as a range like 'matrix[begin..end]', which can be used as is
				ranges[dimension] = a;
			} else static if (is(typeof(a) : size_t)) {
				// This dimension is specified as a single index value like 'matrix[i]', which we want to represent as a single-element range
				ranges[dimension] = Range(a, a + 1);
			} else {
				// We don't expect other types
				static assert(
					false, format("Invalid index type: %s",
						typeof(a).stringof));
			}
		}
		// Return the sub-matrix that is specified by 'arguments'
		return subMatrix(ranges[0], ranges[1]);
	}

	// Assigns the specified value to each element of the sub-matrix
	Matrix opIndexAssign(A...)(int value, A arguments) if (A.length <= 2) {
		writeln(__FUNCTION__);
		Matrix subMatrix = opIndex(arguments);
		return subMatrix = value;
	}

	// Uses each element of the sub-matrix and a value in a binary operation and assigns the result back to that element
	Matrix opIndexOpAssign(string op, A...)(int value,
		A arguments) if (A.length <= 2) {
		writeln(__FUNCTION__);
		Matrix subMatrix = opIndex(arguments);
		mixin("return subMatrix " ~ op ~ "= value;");
	}
}

// Executes the expression that is specified as a string, and prints the result as well as the new state of the matrix
void execute(string expression)(Matrix m) {
	writefln("\n--- %s ---", expression);
	mixin("auto result = " ~ expression ~ ";");
	writefln("result:\n%s", result);
	writefln("m:\n%s", m);
}
