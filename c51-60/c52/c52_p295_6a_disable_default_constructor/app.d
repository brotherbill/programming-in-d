void main() 
{
	auto a1 = Archive("records");
	auto a2 = Archive("");
	auto a3 = Archive(null);
	auto a4 = Archive();
	auto a5 = Archive.init;
}

struct Archive 
{
	string fileName;

	// Disable the default constructor.  
	// Explicit constructors must be defined.
	// May not explicitly define a parameterless constructor.
	// @disable this();  
	// This won't compile
	// this()
	// {
	// 	this.fileName = "default_file_name";
	// }

	// this(string fileName)
	// in (fileName.length > 0, "fileName must not be empty")
	// {
	// 	this.fileName = fileName;
	// }
}
