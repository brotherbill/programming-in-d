import std.stdio : writeln;

void main() 
{
	// auto piece = new ChessPiece;		 // ← compilation ERROR.  Can't instantiate an abstract class.
	auto piece = new Pawn;
	Square from = { 'A', 2 };
	Square to   = { 'A', 4 };

	bool isValid = piece.isValid(from, to);
	writeln("pawn move is valid: ", isValid);
}

// abstract should be added here, but D doesn't require it, as ChessPiece has an abstract method.  
// Be nice and add 'abstract' anyway.  The reader will appreciate the clarity.
abstract class ChessPiece 
{
	abstract bool isValid(Square from, Square to) 
	{
		// We require the 'to' position to be different than the 'from' position
		return from != to;
	}
}

struct Square 
{
	char column; // A - H
	int  row; 	 // 1 - 8

	int opCmp(Square rhs) const 
	{
		if (column == rhs.column && row == rhs.row)
			return 0;

		if (column < rhs.column)
			return -1;

		if (column > rhs.column)
			return +1;

		if (row < rhs.row)
			return -1;

		return +1;
	}
}

class Pawn : ChessPiece 
{
	override bool isValid(Square from, Square to) 
	{
		// ... the implementation of isValid for pawn ...

		// First verify if it is a valid move for any ChessPiece
		if (!super.isValid(from, to)) 
		{
			return false;
		}

		// pawn can move forward one square, or two squares if it is the pawn's first move.  
		// For simplicity, we will ignore captures and en passant.
		// ...
		
		return true;
	}
}
