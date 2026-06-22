# c33_p147_a_overview

There are several ways to mutate a variable 

Reassign it to something else 
int foo = 42; 
foo = 86; 

Change its contents 
  char[] foo = cast(char[])"greetings"; 
  foo[0] = 'G'; 

Extend more elements or change length 

  string foo = "greetings"; 
  foo ~= " Earthling"; 
  foo.length = 15; 

Immutability is shutting down one or more of these ways of mutation. 
Full, deep immunity is shutting down all ways of mutation for this “variable”. 

Transitive immunity. 
It helps to tell the Turtle joke, which everyone knows. 
Here goes:  An old lady went to the local planetarium and said that all that you speak about a big bang and physics is all bunk.  Instead, there is a giant turtle holding up the Earth.  The clever scientist then asks: What is holding up the giant turtle?  The old lady responds:  I see where you are going.  It is turtles all the way down. 

It is similar in D.  Once a variable is immutable, it is immutable “all the way down”, or as you will see in the D “Spec”, it has “Transitive Immunity”. 

The benefit is that immutability is built into D, and this provides guarantees that this variable and its graph will not change.  Thus, for concurrency, if each actor is passed immutable variables, there is no concern for locking or race conditions, as immutable variables do not need locking, nor do they participate in race conditions. 

The Functional Programming style also works strongly with immutable variables. 
 
Some languages call immutable variables “values”, as they don’t vary. 
D still calls them “variables”. 

By default, variables are mutable and may vary. 
It is only by making them const or immutable, that they get locked in to const-ness. 