import std.stdio;

void main()
{
	// A single line comment
	writeln("All about comments."); // another single line comment

	/* A multi-line comment that spans multiple lines.
	   This does not nest, so you can't have another {slash}{star} ... {star}{slash} within it.
	   // and can include slashes
	   /+ is a valid comment in D +/
	*/

	/+ A multi-line comment that nests inside another comment
	   // This is a single line comment inside the nested comment
	   /+ This is a nested comment within the containing multi-line comment +/
	   /* This is a multi-line comment inside the nested comment */
	 +/
}
