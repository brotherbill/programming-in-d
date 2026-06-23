import std.stdio : writefln;

void main()
{
    auto whiteKing = new ChessPiece(Piece.king, 'A', 5, true);
    assert(whiteKing !is null);
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
        this.piece              = piece;
        this.horizontalLocation = horizontalLocation;
        this.verticalLocation   = verticalLocation;
        this.isWhite            = isWhite;
    }
}
