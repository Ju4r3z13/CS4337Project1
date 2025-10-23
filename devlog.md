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
