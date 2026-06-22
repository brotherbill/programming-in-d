# Command – Query Separation (CQS) 

Just like almost every other programming language, there are two kinds of functions. 

You have procedures that “do something” such as printing, but don’t return a result. 
Then you have functions that answer a query, such as how much is 2 + 2? 
These functions should be “pure” if possible and given the same arguments, produce the same result, without changing anything. 

And there are the weird functions such as “compare and swap” used in concurrency that make a change and then report on the change.  These should be the exception to the rule. 

That is, 2 + 2 should ALWAYS equal 4, without writing to the file system. 

This is known as Command – Query Separation. 
A Command does something, such as write to the file system, but doesn’t tell you what it did or how things went.  Its focus is on action.  Write some bytes to the file system. 

A Query should give you the same result given the same arguments, but not change anything such as the console or the file system.  

This is gospel in Eiffel language, but rarely done in other languages. 
D does not enforce Command – Query Separation, but for developers, this provides some needed sanity.   

There are times in D, especially in concurrency where we break this rule.  That should be the exception, not the rule. 

To maintain this rule generally requires using a struct or class object. 
 
Let’s say you want to read up to 80 characters from a file. 
There is a library function to do this, and it does two things: 
1. It populates a buffer such as a dynamic array with up to 80 characters. 
2. It returns whether it was successful or had an error. 
3. It returns the number of characters written or a negative number to indicate an error. 

Using Command – Query Separation, we would have two kinds functions: 
1. void read(char[] buffer, size_t max_chars_to_read)   // Command 
2. bool   success()								        // Query 
3. size_t count_characters_last_read_in()			    // Query 
4. string last_buffer_read_in();                        // Query

The read function will read up to max_chars_to_read characters to buffer. 
The success function indicates whether the last read was successful. 
The count_characters_last_read_in function will return the same answer repeatedly, where that answer is how many characters were read in the last read() command.  One would use a slice to read the available characters in the buffer. 

Trust me, this is a better way to code.  Unfortunately, the libraries are not written this way, so if you are dogmatic about this, someone perhaps you, will need to write a version of the library that supports Command – Query separation. 

The downside to Command – Query separation is that at the micro-optimization level, it may be a tiny bit slower than combining Command and Query into the same function.  If this matters, then conspicuously break CQS (Command – Query Separation) in that case. 

Without CQS, it is more challenging to reason with a function that changes state and returns a value.  One needs to capture the return value, if there is a need to access it multiple times. 

With CQS, there is a separation of concerns.  The command is responsible for changing state, such as adding a new item to the shopping cart.  The query can ask several times as to how many items are in the cart, without adding or removing items from the cart. 

In general library code is of higher quality that application code, so if you have to “capture” result codes, that is more error prone. 

With CQS, there is less need to “save” query results into local variables as the queries may be called many times as needed. 

As always the case with optimization, early optimization is the root of all evil. 
If the optimization is “free” and easy, it is a no brainer to use it. 

In general, measure where the application bogs down, and then focus the optimization efforts on the critical areas where the optimization will make a difference. 

The counter point is that if the bottleneck is in 5% of the code that takes 95% of processing time, if you focused on the other 95% of the code and got the time down to zero, you would only improve the run time by 5%. 