# Project

Follow the [instructions](INSTRUCTIONS.md), use this space to document your project for yourself and the graders.

## Names
Members: Laura Reeve, Thomas Crosbie-Walsh, Andrew
## Summary
put a short summary here
## Plan


Members: Laura Reeve, Thomas Crosbie-Walsh, Andrew

We will use Thomas' Week10 code as the base for our project and build off of it. 

Required operators:
Infix Operators (precedence classes, in increasing order, L associative except as noted, for arithmetic,relational,
    and boolean operators both operands must be same type)
  
 
    ;     Separator                  -- lowest precedence, R associative
  
 
          Application                -- function application (no operators, just a blank between expressions)
  
 	
    :     List cons                  -- R associative
    ++    List concatenation         -- R associative
   
    
    +     Addition                   -- these 2 operators overloaded for integers and floats
    -     Subtraction                -- this is overloaded to also be a unary minus function (see below)
   
    
    *     Multiplication             -- overloaded for integers and floats                          
    /     Floating-Point Division     
    //    Integer Division   
    %     Modulus (remainder after integer division)    -- only for integers
    
   
    ^     Floating-Point Exponentiation             -- R associative
    **    Integer Exponential                       -- R associative
  
 
    &&    Boolean And              
   
    
    ||    Boolean Or 
    
   
                                     -- relational operators are non-associative (can only be one operator 
                                     -- in an expression) 
    ==    Equals                     -- equality operators are overloaded for all types except functions                  
    /=    Not-equal                                                     
    <     Less-than                  -- these four operators only need to compare integers and floats,  
    <=    Less-than-or-equal                              
    >=    Greater-than-or-equal              
    >     Greater-than 
    
    
    !!    List indexing operator     -- R associative, left operand must be list, right must be integer
  
  Miscellaneous

    -          unary minus
    \ and ->   Lambda abstraction constructors
    [ and ]    List constructors, "," as separator
    ' and '    Char constructors
    " and "    String constructors
    --    Start of comment line (ignore everything until the next newline)
    {-    Start of multi-line comment 
    -}    End of multi-line comment

    Also include expressions defined by keywords, i.e., Boolean not, if-then-else, let-in, and print. 
  
     
Predefined Functions

    head
    tail
    elem                       -- only for types with equality; for instance: (elem (\y -> 0) [(\x -> x*0)] ) should return an error
    map
    filter
    foldr
    ord     (char -> integer)
    chr     (integer -> char)
    float   (integer -> float)
    int     (float -> integer with truncation)


Additional side stuff:
- Make sure Ast and Val are showable.
- Make exec function (update run function)
- Dynamic type-checking
- Must support ints, bools, curried funcs
- Modify EnvUnsafe to include logging 
- eval func for ast using modified monad
- DOCUMENTATION

Additional features: (30/100 pts)
- 5pt Add an infix function composition operator (.). So you may write f . g instead of \x -> f (g x)
- 5pt Make lambdas support multiple arguments. So you may write \x y z -> x instead of \x -> \ y -> \ z -> x
- 5pt Add multiple sequential definitions to let. So you may write let x = 4, y = x + 5, z = y in z * 2 instead of let x = 4 in (let y = x + 5 in (let z = y in z * 2))
- 5pt Add letrec to make recursion more convenient. So you can write letrec f = \ x -> if x == 0 then 1 else x * (f (x-1)) in f 5. Alternatively you may also add this functionality to let. We will talk about this in lecture this week.
- 10pt Add error reporting to the Parser monad, your parser should fail with clear context specific error messages.

** May switch out some features for others once we begin.


How the work will be divided:

We will all work on the first 60 pts. worth of work together and break up the pieces as we go, trying to ensure that no one is doing significantly more than anyone else. For the other 30 pts of extra work, it will be broken up as such:

Thomas: let, letrec
Laura: infix, lambdas
Andrew: error reporting

This is subject to change and we will all be working together on it, but this is a rough outline of our work schedule. 

Group Deadlines:
1. We are going to aim to have all of the basic operators (first 60 pts) done by 4/28 at the latest (preferably by Saturday, 4/27) and then we will have the final week to work on our additional parts of the project.
2. We will aim to meet on Monday morning, Tuesday evening, and do a lot on Friday 4/26.

