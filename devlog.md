10/14/2025 2:11 pm
I will create a prefix-notation expression calculator in Racket. 
I will be using Racket because it is the functional programming language we have been using so far, and it is the one I am the most familiar with.
My overall plan is to first build the evaluation loop and expression parser. 
Then I will focus on the security of the logic.

10/23/2025 11:56am (worked on 10/20/2025 8:40 pm)
I started the project in an online Racket compiler (https://share.google/Dvm4etcw1MJF4EiQO).
I appended the "mode.rkt" into my main code.
I wrote a simple tokenizer function using the string-split:
"define (to-token line) (string-split line))"
I also wrote a general skeleton for what my program should look like:
1. mode function (already given)
2. to-token (already built)
3. eval-expression
4. main-loop
5. error-handler
6. history

10/23/2025 12:22 pm
I have written a prompter logic where I prompt the user for an expression and if the input is "quit", the program stops.
I set up a flag to catch exceptions, however I am leaving space for the error handling logic which I will work later.
I am focusing on evaluating the input now. The input is tokenized and the tokens are then taken to the function "eval-expression"
I am deciding how will de logic of the loop works.

10/23/2025 12:52 pm
I have finished most of the main main logic, error handling was suggested by the ai assistant of the compiler but it is pretty complex to understand.
I will try to understand the syntax otherwise I will use the methods seen in class.
I am now missing the final error handling in main and the history handling in main which I haven't put much thought into it so far.
I did get started on eval-expression using the string->number function to convert tokens into numerical values.

10/24/2025 9:32 am (worked on 10/23/2025 11:40 pm)
I have made progress with the eval function. I took a portion of it out of my main code and created a separate code to test it.
I made a switch statement using "cond" to perform operations when tokens are operators. 
I built a helper using "char-numeric?" to discriminate the tokens.

10/24/2025 10:45 am 
I completed the eval-expression function logic now I must test for errors.
I also need to fix the operator logic where I made the mistake of interpreting "-" as a subtraction.
However the project indicates it is a "unary operator that negates the value of an expression"
So next fixes are the use of "-", implementing history, and doing error checking.

10/24/2025 1:30 pm
Still working in the history logic, it has been kind of confusing to undesrtand what I need to do with the $n part.
I have completed all error handling in eval-expression and fixed all logic errors so far. 
I am yet to test the entirety of the function because the carried variable "history" is not assigned anything yet.

10/24/2025 1:49 pm
This is what the problem looks like compared to the original outline:
1. mode function (already given)
2. to-token (already built)
3. eval-expression (Already built missing history reference)
4. main-loop (In process)
5. error-handler (REMOVED, errors now handled inside eavl-expression)
6. history (STILL NOT BUILT)
I have now re-read the definition of history in the project. Hee is how I will do it:
HistoryFunction (just to distinguish it from the history list) will be a helper to eval-function, where History is a list containing previous results referenced by $n.

10/24/2025 6:17 pm
I have finishedthe main logic and the history logic. Now I am fixing the parenthesis mismatch.
I made two helpers for history, one to set it and one to read it.

10/24/2025 9:29 pm
Ran into issues while running the code:
- Entering "quit" doesn't exit the program until it occurs twice
- Errors in the parsing of the string
- eval-expression had errors in syntax where a condition could not be followed by the definition of a variable.
