import std.stdio;
import std.string;

void main() {
	auto center = Coordinate( x: 10, y: 20 );
	Coordinate * ptr = &center;					// pointer definition
	writeln(*ptr); 								// (10, 20)		// Object access via dereference
	writeln(ptr); 								// 83506FF880
	writeln(ptr.toString); 						// (10, 20)		// Object access via pointer (D automatically dereferences)
	writeln;

	adjustXCoordinateClassicWay(ptr);			// Pass pointer to function
	writeln("ClassicWay: ", center); 			// (20, 20)		// Original object modified
	writeln;

	adjustXCoordinateEasyDWay(ptr);				// Pass pointer to function
	writeln("EasyDWay: ", center); 				// (30, 20)		// Original object modified

}

struct Coordinate {
	int x;
	int y;

	string toString() const {
		return format("(%s,%s)", x, y);
	}
}

void adjustXCoordinateClassicWay(Coordinate * ptr) {
	(*ptr).x += 10; 								// Modify the value at the pointer address
}

void adjustXCoordinateEasyDWay(Coordinate * ptr) {
	ptr.x += 10; 									// Modify the value at the pointer address
}