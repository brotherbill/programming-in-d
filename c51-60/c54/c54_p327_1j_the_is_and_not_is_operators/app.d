import std.stdio : writefln;

void main()
{
    auto whiteKing = new ChessPiece(Piece.king, 'A', 5, true);
    auto whiteKing2 = new ChessPiece(Piece.king, 'A', 5, true);

    assert(whiteKing !is null);

    // Won't compile if uncommented, you can only compare references to null with is and !is
    // assert(whiteKing == null);		

    assert(whiteKing2 !is null);

    assert(whiteKing !is whiteKing2); // all members have same data, but references differ
    assert(whiteKing != whiteKing2); // !is and != are equivalent.  Similarly is and == are equivalent.

    writefln("whiteKing is at %s%s.", whiteKing.horizontalLocation, whiteKing.verticalLocation);
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

    this(Piece piece, char horizontalLocation, int verticalLocation, bool isWhite)
    {
        this.piece = piece;
        this.horizontalLocation = horizontalLocation;
        this.verticalLocation = verticalLocation;
        this.isWhite = isWhite;
    }
}
