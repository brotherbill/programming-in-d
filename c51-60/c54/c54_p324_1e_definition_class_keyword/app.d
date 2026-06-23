void main()
{
	auto whiteKing = new ChessPiece(Piece.king, 'A', 5, true);

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

	this(in Piece piece, in char horizontalLocation, in int verticalLocation, in bool isWhite)
	{
		this.piece              = piece;
		this.horizontalLocation = horizontalLocation;
		this.verticalLocation   = verticalLocation;
		this.isWhite            = isWhite;
	}
}
