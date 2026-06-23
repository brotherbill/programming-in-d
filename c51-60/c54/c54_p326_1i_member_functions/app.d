import std.stdio;
import std.exception : enforce;

 static Player whitePlayer = Player("Alice", true);
 static Player blackPlayer = Player("Bob", false);
 static Player activePlayer;

void main()
{
    activePlayer = whitePlayer;

    auto whiteKing = new ChessPiece(Piece.king, 'A', 5, true);
    assert(whiteKing !is null);

    auto blackPawn = new ChessPiece(Piece.pawn, 'A', 4, false);

    whiteKing.attack(blackPawn);
}

struct Player
{
    string name;
    bool isWhite;

    this(string name, bool isWhite)
    {
        this.name    = name;
        this.isWhite = isWhite;
    }
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

    // This would be better found in Game class, but we will leave it here for tutorial purpose
    /*final*/ void attack(ChessPiece attackee)
    {
        enforce(this.isWhite == activePlayer.isWhite, "You can attack only with your own pieces");    
        // checks if attacking attackee is legal.
        enforce(this.isWhite != attackee.isWhite, "You can't attack your own piece");
        validateNotCaptured(this);    // attacker must be on the board and not captured
        validateNotCaptured(attackee);    // attackee must be on the board and not captured
        validateMove(this, attackee); // attacker can move to attackee's position according to the rules of chess for that piece type
        validateNotInCheckAfterMove(this, attackee); // attacker won't put its own king in check after the move

        remove(attackee);           // remove attackee from the board, marking it as captured
        move(this, attackee);   // move attacker to attackee's position
        announceCheckOrCheckmate(); // check if the move has put the opponent's king in check or checkmate, and announce it if so
    }

    void validateNotCaptured(ChessPiece piece) { }
    void validateMove(ChessPiece attacker, ChessPiece attackee) { }
    void validateNotInCheckAfterMove(ChessPiece attacker, ChessPiece attackee) { }
    void remove(ChessPiece piece) { }
    void move(ChessPiece attacker, ChessPiece attackee) { }
    void announceCheckOrCheckmate() { }
}

class FancyChessPiece : ChessPiece
{
    this(Piece piece, char horizontalLocation, int verticalLocation, bool isWhite)
    {
        super(piece, horizontalLocation, verticalLocation, isWhite);
        this.piece = piece;
        this.horizontalLocation = horizontalLocation;
        this.verticalLocation = verticalLocation;
        this.isWhite = isWhite;
    }

    // This won't compile as attack() is final in class ChessPiece
    override void attack(ChessPiece attackee)
    { 
        writeln("Override attack");
    }
}
