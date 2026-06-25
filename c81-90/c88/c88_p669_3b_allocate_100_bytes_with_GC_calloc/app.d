import std.stdio;
import core.memory;

void main()
{
	void * buffer      = GC.calloc(100);	// A memory area of 100 zero bytes
	int  * intBuffer   = cast(int *)buffer;	// A memory area for 25 integers
	void * voidBuffer1 = GC.calloc(4);

	int  * intBuffer2  = cast(int *)GC.calloc(100);
	void * buffer2     = GC.calloc(4);

	int  * intBuffer3  = cast(int *)GC.calloc(int.sizeof * 25);
	void * buffer3     = GC.calloc(0);
	void * buffer4     = GC.calloc(4);

	writeln("intBuffer   : ", typeof(intBuffer).stringof);
    writeln("voidBuffer1 : ", typeof(voidBuffer1).stringof);
    writeln("intBuffer   : ", intBuffer);
    writeln("voidBuffer1 : ", voidBuffer1);
    writeln("Difference  : ", cast(void *)voidBuffer1 - cast(void *)intBuffer);
	writeln;

	writeln("intBuffer2   : ", typeof(intBuffer2).stringof);
    writeln("buffer2      : ", typeof(buffer2).stringof);
    writeln("intBuffer2   : ", intBuffer2);
    writeln("buffer2      : ", buffer2);
    writeln("Difference  : ", cast(void *)buffer2 - cast(void *)intBuffer2);
	writeln;

	writeln("intBuffer3   : ", typeof(intBuffer3).stringof);
    writeln("buffer3      : ", typeof(buffer3).stringof);
    writeln("intBuffer3   : ", intBuffer3);
    writeln("buffer3      : ", buffer3);
    writeln("buffer4      : ", buffer4);
    writeln("Difference  : ", cast(void *)buffer3 - cast(void *)intBuffer3);
    writeln("Difference  : ", cast(void *)buffer4 - cast(void *)intBuffer3);
}
