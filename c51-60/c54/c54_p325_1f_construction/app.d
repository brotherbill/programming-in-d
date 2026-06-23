void main()
{
	auto whiteKing = new ChessPiece(Piece.king, 'A', 5, true); // won't compile without explicit instructor

	assert(whiteKing !is null);
}

enum Piece
{
	pawn,
	knight,
	bishop,
	rook,
	queen,
	king
}

class ChessPiece
{
	Piece piece;
	char  horizontalLocation;
	int   verticalLocation;
	bool  isWhite;

	// explicit constructor.  Won't compile without it.
	// this(Piece piece, char horizontalLocation, int verticalLocation, bool isWhite) {
	//  this.piece              = piece;
	// 	this.horizontalLocation = horizontalLocation;
	// 	this.verticalLocation   = verticalLocation;
	// 	this.isWhite            = isWhite;
	// }
}
