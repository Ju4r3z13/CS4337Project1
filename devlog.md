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

